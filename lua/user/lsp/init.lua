require("user.lsp.languages.js-ts")
require("user.lsp.languages.sh")
require("user.lsp.languages.rust")
require("user.lsp.languages.cpp")

-- vim.diagnostic.config { virtual_text = false }

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

