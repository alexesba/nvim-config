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

  local function find_keymap(lhs)
    for _, keymap in ipairs(vim.api.nvim_get_keymap("n")) do
      if keymap.lhs == lhs then
        return keymap
      end
    end
  end

  before_each(function()
    helpers.reload_module("utils.map")
    map = require("utils.map").map
  end)

  it("sets noremap by default", function()
    map("n", "tmaptest", "<nop>", { desc = "test mapping" })

    local found = find_keymap("tmaptest")
    assert.is_not_nil(found)
    assert.equals(1, found.noremap)
    assert.equals("test mapping", found.desc)
  end)

  it("merges caller options into the keymap", function()
    map("n", "tmaptest2", "<nop>", { silent = true, desc = "silent map" })

    local found = find_keymap("tmaptest2")
    assert.is_not_nil(found)
    assert.equals(1, found.noremap)
    assert.equals(1, found.silent)
    assert.equals("silent map", found.desc)
  end)
end)

describe("utils.functions", function()
  local function with_buffer(lines, fn)
    vim.api.nvim_buf_set_lines(0, 0, -1, true, lines)
    fn()
    return vim.api.nvim_buf_get_lines(0, 0, -1, false)
  end

  before_each(function()
    helpers.reload_module("utils.functions")
    require("utils.functions")
  end)

  it("ConvertTabToSpaces replaces tabs with two spaces", function()
    local lines = with_buffer({ "hello\tworld" }, ConvertTabToSpaces)
    assert.same({ "hello  world" }, lines)
  end)

  it("RemoveEmptyLines deletes blank lines", function()
    local lines = with_buffer({ "keep", "", "also" }, RemoveEmptyLines)
    assert.same({ "keep", "also" }, lines)
  end)

  it("DoubleQuotes converts single-quoted strings to double quotes", function()
    local lines = with_buffer({ "x = 'value'" }, DoubleQuotes)
    assert.same({ 'x = "value"' }, lines)
  end)

  it("SingleQuotes converts double-quoted strings to single quotes", function()
    local lines = with_buffer({ 'x = "value"' }, SingleQuotes)
    assert.same({ "x = 'value'" }, lines)
  end)

  it("CleanWhiteSpaces strips trailing whitespace", function()
    local lines = with_buffer({ "trim me   " }, CleanWhiteSpaces)
    assert.same({ "trim me" }, lines)
  end)

  it("UnscapeDoubleQuotes removes escaped double quotes", function()
    local lines = with_buffer({ [[say \"hi\"]] }, UnscapeDoubleQuotes)
    assert.same({ "say hi" }, lines)
  end)

  it("RemoveLineBreak removes literal backslash-n sequences", function()
    local lines = with_buffer({ [[line1\nline2]] }, RemoveLineBreak)
    assert.same({ "line1line2" }, lines)
  end)

  it("HashNewSyntax converts old hash rocket to new syntax", function()
    local lines = with_buffer({ "  :foo => 1" }, HashNewSyntax)
    assert.same({ "  foo: 1" }, lines)
  end)

  it("HashOldSyntax converts new hash syntax back to rocket form", function()
    local lines = with_buffer({ "foo: 'bar'" }, HashOldSyntax)
    assert.same({ ":foo => 'bar'" }, lines)
  end)

  it("preserves the cursor when transforming buffer text", function()
    vim.api.nvim_buf_set_lines(0, 0, -1, true, { "  :foo => 1", "unchanged" })
    vim.api.nvim_win_set_cursor(0, { 2, 0 })

    HashNewSyntax()

    assert.same({ 2, 0 }, vim.api.nvim_win_get_cursor(0))
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
