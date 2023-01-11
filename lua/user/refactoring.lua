local M = {}

function M.setup()
  local refactor = require "refactoring"
  refactor.setup {}

  require("telescope").load_extension "refactoring"

  vim.api.nvim_set_keymap(
    "v",
    "<leader>rr",
    "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
    { noremap = true }
  )
end

return M
