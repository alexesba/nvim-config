local helpers = require("tests.helpers")

describe("reprobado", function()
  local reprobado

  local function capture_notify(fn)
    local messages = {}
    local notify = vim.notify
    vim.notify = function(msg, ...)
      messages[#messages + 1] = msg
    end
    fn()
    vim.notify = notify
    return messages
  end

  before_each(function()
    helpers.reload_reprobado()
    reprobado = require("reprobado")
  end)

  describe("setup", function()
    it("uses a custom sounds_dir when resolving files", function()
      local dir = helpers.temp_dir()
      local messages = capture_notify(function()
        reprobado.setup({ sounds_dir = dir, player = "true" })
        reprobado.play("custom.ogg")
      end)
      assert.matches("/custom%.ogg", messages[1])
      assert.is_true(messages[1]:find(dir, 1, true) ~= nil)
    end)
  end)

  describe("play", function()
    it("lazy-inits defaults when setup was not called", function()
      assert.has_no.errors(function()
        reprobado.play("Reprobado.ogg")
      end)
    end)

    it("returns without error when player is missing", function()
      reprobado.setup({
        sounds_dir = helpers.temp_dir(),
        player = "not-a-real-player-xyz",
      })
      assert.has_no.errors(function()
        reprobado.play("test.ogg")
      end)
    end)

    it("notifies when sound file is missing", function()
      local dir = helpers.temp_dir()
      local messages = capture_notify(function()
        reprobado.setup({ sounds_dir = dir, player = "true" })
        reprobado.play("missing.ogg")
      end)
      assert.matches("missing sound file", messages[1])
    end)
  end)

  describe("setup_commands", function()
    it("registers Reprobado and Reprobada user commands", function()
      reprobado.setup_commands()
      local cmds = vim.api.nvim_get_commands({})
      assert.is_not_nil(cmds.Reprobado)
      assert.is_not_nil(cmds.Reprobada)
      assert.equals("Play Reprobado sound", helpers.command_desc(cmds.Reprobado))
      assert.equals("Play Reprobada sound", helpers.command_desc(cmds.Reprobada))
    end)

    it("invokes play with the expected sound file", function()
      local dir = helpers.temp_dir()
      local played

      reprobado.setup({ sounds_dir = dir, player = "true" })
      helpers.touch(dir .. "/Reprobada.ogg")
      reprobado.setup_commands()

      local original_play = reprobado.play
      reprobado.play = function(filename)
        played = filename
      end

      vim.api.nvim_get_commands({}).Reprobada.callback()
      reprobado.play = original_play

      assert.equals("Reprobada.ogg", played)
    end)
  end)

  describe("ensure_player", function()
    local function missing_player_mocks(overrides)
      overrides = overrides or {}
      local jobstarts = overrides.jobstarts or {}

      return {
        executable = overrides.executable
          or function(name)
            if name == "ogg123" then
              return 0
            end
            return 0
          end,
        system = overrides.system or function(_)
          return "Linux\n"
        end,
        jobstart = overrides.jobstart
          or function(cmd, opts)
            jobstarts[#jobstarts + 1] = { cmd = cmd, opts = opts }
            return #jobstarts
          end,
        jobstarts = jobstarts,
      }
    end

    it("returns without error when player already exists", function()
      reprobado.setup({ player = "true" })
      assert.has_no.errors(function()
        reprobado.ensure_player()
      end)
    end)

    it("does not start an install job when the player is already available", function()
      local mocks = missing_player_mocks({
        executable = function(name)
          return name == "ogg123" and 1 or 0
        end,
      })

      helpers.with_mocked_fn(mocks, function()
        reprobado.ensure_player()
      end)

      assert.equals(0, #mocks.jobstarts)
    end)

    it("installs vorbis-tools via apt-get on Linux", function()
      local mocks = missing_player_mocks({
        executable = function(name)
          return name == "apt-get" and 1 or 0
        end,
      })

      local messages = capture_notify(function()
        helpers.with_mocked_fn(mocks, function()
          reprobado.ensure_player()
        end)
      end)

      assert.equals(1, #mocks.jobstarts)
      assert.same({ "sudo", "apt-get", "install", "-y", "vorbis-tools" }, mocks.jobstarts[1].cmd)
      assert.matches("installing vorbis%-tools", messages[1])
    end)

    it("installs vorbis-tools via brew on macOS", function()
      local mocks = missing_player_mocks({
        system = function(_)
          return "Darwin\n"
        end,
        executable = function(name)
          return name == "brew" and 1 or 0
        end,
      })

      local messages = capture_notify(function()
        helpers.with_mocked_fn(mocks, function()
          reprobado.ensure_player()
        end)
      end)

      assert.equals(1, #mocks.jobstarts)
      assert.same({ "brew", "install", "vorbis-tools" }, mocks.jobstarts[1].cmd)
      assert.matches("installing vorbis%-tools", messages[1])
    end)

    it("warns when Homebrew is missing on macOS", function()
      local mocks = missing_player_mocks({
        system = function(_)
          return "Darwin\n"
        end,
      })

      local messages = capture_notify(function()
        helpers.with_mocked_fn(mocks, function()
          reprobado.ensure_player()
        end)
      end)

      assert.equals(0, #mocks.jobstarts)
      assert.matches("Homebrew not found", messages[1])
    end)

    it("warns when no supported package manager is found on Linux", function()
      local messages = capture_notify(function()
        helpers.with_mocked_fn(missing_player_mocks(), function()
          reprobado.ensure_player()
        end)
      end)

      assert.matches("No supported package manager found", messages[1])
    end)

    it("warns on unsupported operating systems", function()
      local mocks = missing_player_mocks({
        system = function(_)
          return "FreeBSD\n"
        end,
      })

      local messages = capture_notify(function()
        helpers.with_mocked_fn(mocks, function()
          reprobado.ensure_player()
        end)
      end)

      assert.matches("Unsupported OS", messages[1])
    end)

    it("notifies when the install job succeeds", function()
      local mocks = missing_player_mocks({
        executable = function(name)
          return name == "apt-get" and 1 or 0
        end,
      })

      local messages = capture_notify(function()
        helpers.with_mocked_fn(mocks, function()
          reprobado.ensure_player()
          mocks.jobstarts[1].opts.on_exit(0, 0)
        end)
      end)

      assert.matches("installed successfully", messages[2])
    end)

    it("notifies when the install job fails", function()
      local mocks = missing_player_mocks({
        executable = function(name)
          return name == "apt-get" and 1 or 0
        end,
      })

      local messages = capture_notify(function()
        helpers.with_mocked_fn(mocks, function()
          reprobado.ensure_player()
          mocks.jobstarts[1].opts.on_exit(0, 1)
        end)
      end)

      assert.matches("Failed to install vorbis%-tools %(exit code 1%)", messages[2])
    end)
  end)
end)