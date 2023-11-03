return {
  'weilbith/nvim-code-action-menu',
  cmd = "CodeActionMenu",
  keys = {
    {
      "<leader>ac", ":CodeActionMenu<cr>", silent = true, noremap = true
    }
  },
  config = function()
    vim.g.code_action_menu_show_diff = false
    vim.g.code_action_menu_show_details = false
  end
}
