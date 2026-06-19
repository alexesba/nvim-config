local helpers = require("tests.helpers")

describe("utils.cmdPreservePosition", function()
  it("restores the cursor after running a command", function()
    vim.api.nvim_buf_set_lines(0, 0, -1, true, { "one", "two", "three" })
    vim.api.nvim_win_set_cursor(0, { 2, 0 })

    local preserve = require("utils.cmdPreservePosition")
    preserve("1")

    assert.same({ 2, 0 }, vim.api.nvim_win_get_cursor(0))
  end)
end)

describe("utils.map", function()
  local map

  before_each(function()
    helpers.reload_module("utils.map")
    map = require("utils.map").map
  end)

  it("sets noremap by default", function()
    map("n", "tmaptest", "<nop>", { desc = "test mapping" })

    local found
    for _, keymap in ipairs(vim.api.nvim_get_keymap("n")) do
      if keymap.lhs == "tmaptest" then
        found = keymap
        break
      end
    end

    assert.is_not_nil(found)
    assert.equals(1, found.noremap)
    assert.equals("test mapping", found.desc)
  end)
end)

describe("utils.local", function()
  local local_util
  local overlay_name = "test-overlay-xyz"
  local overlay_path

  before_each(function()
    helpers.reload_module("utils.local")
    local_util = require("utils.local")
    overlay_path = helpers.local_overlay_path(overlay_name)
    helpers.remove_file(overlay_path)
  end)

  after_each(function()
    helpers.remove_file(overlay_path)
    _G.__test_overlay_loaded = nil
  end)

  it("skips missing local overlay files", function()
    assert.has_no.errors(function()
      local_util.load(overlay_name)
    end)
  end)

  it("loads a present overlay file", function()
    helpers.write_local_overlay(overlay_name, "_G.__test_overlay_loaded = true\n")

    local_util.load(overlay_name)

    assert.is_true(_G.__test_overlay_loaded)
  end)

  it("notifies when an overlay file fails to load", function()
    helpers.write_local_overlay(overlay_name, "this is not valid lua\n")

    local messages = helpers.capture_notify(function()
      local_util.load(overlay_name)
    end)

    assert.matches("^Failed to load test%-overlay%-xyz%.local%.lua:", messages[1])
  end)
end)
