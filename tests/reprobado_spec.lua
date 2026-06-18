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
      assert.equals("Play Reprobado sound", cmds.Reprobado.definition)
      assert.equals("Play Reprobada sound", cmds.Reprobada.definition)
    end)
  end)

  describe("ensure_player", function()
    it("returns without error when player already exists", function()
      reprobado.setup({ player = "true" })
      assert.has_no.errors(function()
        reprobado.ensure_player()
      end)
    end)
  end)
end)

describe("utils.local", function()
  before_each(function()
    package.loaded["utils.local"] = nil
  end)

  it("skips missing local overlay files", function()
    local local_util = require("utils.local")
    assert.has_no.errors(function()
      local_util.load("nonexistent-overlay-name-xyz")
    end)
  end)
end)
