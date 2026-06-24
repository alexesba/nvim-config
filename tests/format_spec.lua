local helpers = require("tests.helpers")

describe("utils.format", function()
  local format

  before_each(function()
    package.loaded["conform"] = nil
    helpers.reload_module("utils.require_tool")
    helpers.reload_module("utils.format")
    format = require("utils.format")
  end)

  it("warns when a required tool is missing", function()
    local messages = helpers.capture_notify(function()
      helpers.with_mocked_fn({
        executable = function()
          return 0
        end,
      }, function()
        format.run({ "sqlformat" }, "Format SQL")
      end)
    end)

    assert.matches("sqlformat", messages[1])
    assert.matches("install with:", messages[1])
  end)

  it("calls conform.format with the requested formatters", function()
    local called
    package.loaded["conform"] = {
      format = function(opts)
        called = opts
        return nil
      end,
    }

    helpers.with_mocked_fn({
      executable = function()
        return 1
      end,
    }, function()
      assert.is_true(format.run({ "sql_formatter_cli" }, "Format SQL"))
    end)

    assert.same({ "sql_formatter_cli" }, called.formatters)
    assert.is_false(called.async)
    assert.equals("never", called.lsp_format)
  end)

  it("notifies when conform reports an error", function()
    package.loaded["conform"] = {
      format = function()
        return "formatter failed"
      end,
    }

    local messages = helpers.capture_notify(function()
      helpers.with_mocked_fn({
        executable = function()
          return 1
        end,
      }, function()
        assert.is_false(format.run({ "json_tool" }, "Format JSON"))
      end)
    end)

    assert.matches("Format JSON: formatter failed", messages[1])
  end)
end)
