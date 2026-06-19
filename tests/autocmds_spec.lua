local helpers = require("tests.helpers")

describe("config.autocmds", function()
  local clipboard
  local expand_result

  local function load_autocmds()
    helpers.reload_module("config.autocmds")
    _G.LazyVim = {
      root = function()
        return "/project"
      end,
    }
    require("config.autocmds")
  end

  local function run_command(name)
    local cmds = vim.api.nvim_get_commands({})
    assert.is_not_nil(cmds[name], "command not registered: " .. name)
    cmds[name].callback()
  end

  before_each(function()
    clipboard = nil
    expand_result = ""
    load_autocmds()
  end)

  describe("command registration", function()
    it("registers formatting and clipboard user commands", function()
      local cmds = vim.api.nvim_get_commands({})

      assert.is_not_nil(cmds.CopyFullPath)
      assert.is_not_nil(cmds.CopyRelativePath)
      assert.is_not_nil(cmds.FormatCss)
      assert.is_not_nil(cmds.FormatJSON)
      assert.is_not_nil(cmds.FormatJSONV2)
      assert.equals("Copy file full path", helpers.command_desc(cmds.CopyFullPath))
      assert.matches("python3 %-m json%.tool", cmds.FormatJSON.definition)
      assert.matches("underscore print", cmds.FormatJSONV2.definition)
    end)
  end)

  describe("CopyFullPath", function()
    it("warns when the buffer has no file path", function()
      expand_result = ""

      local messages = helpers.capture_notify(function()
        helpers.with_mocked_fn({
          expand = function(_)
            return expand_result
          end,
          setreg = function(_, value)
            clipboard = value
          end,
        }, function()
          run_command("CopyFullPath")
        end)
      end)

      assert.is_nil(clipboard)
      assert.equals("Not a file buffer", messages[1])
    end)

    it("copies the normalized full path to the clipboard", function()
      expand_result = "/project//src/app.rb"

      helpers.with_mocked_fn({
        expand = function(_)
          return expand_result
        end,
        setreg = function(_, value)
          clipboard = value
        end,
      }, function()
        run_command("CopyFullPath")
      end)

      assert.equals("/project/src/app.rb", clipboard)
    end)
  end)

  describe("CopyRelativePath", function()
    it("warns when the buffer has no file path", function()
      expand_result = ""

      local messages = helpers.capture_notify(function()
        helpers.with_mocked_fn({
          expand = function(_)
            return expand_result
          end,
        }, function()
          run_command("CopyRelativePath")
        end)
      end)

      assert.equals("Not a file buffer", messages[1])
    end)

    it("copies a path relative to the project root", function()
      expand_result = "/project/src/app.rb"

      helpers.with_mocked_fn({
        expand = function(_)
          return expand_result
        end,
        setreg = function(_, value)
          clipboard = value
        end,
      }, function()
        run_command("CopyRelativePath")
      end)

      assert.equals("src/app.rb", clipboard)
    end)

    it("falls back when the file is outside the project root", function()
      expand_result = "/outside/app.rb"

      helpers.with_mocked_fn({
        expand = function(_)
          return expand_result
        end,
        setreg = function(_, value)
          clipboard = value
        end,
        fnamemodify = function(path, mods)
          if mods == ":~:." then
            return "~/outside/app.rb"
          end
          return path
        end,
      }, function()
        run_command("CopyRelativePath")
      end)

      assert.equals("~/outside/app.rb", clipboard)
    end)
  end)
end)
