require "user.lsp.languages.python"
require "user.lsp.languages.js-ts"
require "user.lsp.languages.sh"
require "user.lsp.languages.emmet"
require "user.lsp.languages.css"

lvim.lsp.diagnostics.virtual_text = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "java",
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

local capabilities = require("lvim.lsp").common_capabilities()

require("typescript").setup {
  -- disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  sources = {
    require "typescript.extensions.null-ls.code-actions",
  },
  server = {
    -- pass options to lspconfig's setup method
    on_attach = require("lvim.lsp").common_on_attach,
    on_init = require("lvim.lsp").common_on_init,
    capabilities = capabilities,
    settings = {
      typescript = {
        inlayHints = {
          includeInlayEnumMemberValueHints = false,
          includeInlayFunctionLikeReturnTypeHints = false,
          includeInlayFunctionParameterTypeHints = false,
          includeInlayParameterNameHints = "none", -- 'none' | 'literals' | 'all';
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = false,
          includeInlayVariableTypeHints = false,
        },
      },
    },
  },
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "clang-format", filetypes = { "java" } },
  { command = "stylua", filetypes = { "lua" } },
  { command = "shfmt", filetypes = { "sh", "zsh" } },
  { command = "prettierd", filetypes = { "css" } },
}

-- lvim.lsp.on_attach_callback = function(client, bufnr)
-- end

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "eslint_d", filetypes = { "javascript" } },
-- }
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup {
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
