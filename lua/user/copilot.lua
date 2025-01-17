local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup {
  panel = {
    keymap = {
      jump_next = "<a-j>",
      jump_prev = "<a-k>",
      accept    = "<a-l>",
      refresh = "r",
      open = "<M-CR>",
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept  = "<a-l>",
      next    = "<a-j>",
      prev    = "<a-k>",
      dismiss = "<a-h>",
    },
  },
  filetypes = {
    yaml      = false,
    markdown  = true,
    help      = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit  = false,
    svn       = false,
    cvs       = false,
    ["."]     = false,
  },
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)
