local helpers = require("tests.helpers")

describe("utils.require_tool", function()
  local require_tool

  before_each(function()
    helpers.reload_module("utils.require_tool")
    require_tool = require("utils.require_tool")
  end)

  it("returns true when the executable is available", function()
    helpers.with_mocked_fn({
      executable = function(name)
        return name == "python3" and 1 or 0
      end,
    }, function()
      assert.is_true(require_tool.ensure("python3"))
    end)
  end)

  it("warns with a brew install hint on macOS", function()
    local messages = helpers.capture_notify(function()
      helpers.with_mocked_fn({
        executable = function()
          return 0
        end,
        system = function()
          return "Darwin\n"
        end,
      }, function()
        assert.is_false(require_tool.ensure("sqlformat"))
      end)
    end)

    assert.matches("sqlformat %(sqlparse%) not found", messages[1])
    assert.matches("pip3 install sqlparse", messages[1])
  end)

  it("warns with an apt install hint on Linux", function()
    local messages = helpers.capture_notify(function()
      helpers.with_mocked_fn({
        executable = function(name)
          return name == "apt-get" and 1 or 0
        end,
        system = function()
          return "Linux\n"
        end,
      }, function()
        assert.is_false(require_tool.ensure("python3"))
      end)
    end)

    assert.matches("Python 3 not found", messages[1])
    assert.matches("sudo apt%-get install %-y python3", messages[1])
  end)

  it("warns with cat fallback when cat is missing", function()
    local messages = helpers.capture_notify(function()
      helpers.with_mocked_fn({
        executable = function()
          return 0
        end,
        system = function()
          return "Linux\n"
        end,
      }, function()
        assert.is_false(require_tool.ensure("cat"))
      end)
    end)

    assert.matches("coreutils", messages[1])
  end)
end)
