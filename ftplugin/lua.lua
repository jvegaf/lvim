local lsp_manager = require "lvim.lsp.manager"
local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup {
  { command = "stylua", filetypes = { "lua" } },
}

lsp_manager.setup("lua_ls", {
  filetypes = { "lua" },
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})

