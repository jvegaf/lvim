-- autocmd are automatically loaded on the VeryLazy event
-- Default autocmd that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmd.lua
-- Add any additional autocmd here
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("general", { clear = true })
autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
  group = "general",
  desc = "Disable New Line Comment",
})

autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach_auto_diag", { clear = true }),
  callback = function(args)
    -- the buffer where the lsp attached
    ---@type number
    local buffer = args.buf

    -- create the autocmd to show diagnostics
    vim.api.nvim_create_autocmd("CursorHold", {
      group = vim.api.nvim_create_augroup("_auto_diag", { clear = true }),
      buffer = buffer,
      callback = function()
        local opts = {
          focusable = false,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          border = "rounded",
          source = "always",
          prefix = " ",
          scope = "cursor",
        }
        vim.diagnostic.open_float(nil, opts)
      end,
    })

    -- vim.keymap.set("n", "gq", function()
    --   vim.lsp.buf.format {
    --     async = false,
    --     filter = function(attachedClient) return attachedClient.name == "null-ls" end,
    --   }
    -- end, { buffer = buffer, noremap = true, silent = true, desc = "Format buffer" })
  end,
})

autocmd("QuitPre", {
  callback = function()
    local invalid_win = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match "NvimTree_" ~= nil then
        table.insert(invalid_win, w)
      end
    end
    if #invalid_win == #wins - 1 then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(invalid_win) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})
