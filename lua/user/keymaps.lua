M = {}
lvim.leader = ","

local opts = { noremap = true, silent = true }
-- For the description on keymaps, I have a function getOptions(desc) which returns noremap=true, silent=true and desc=desc. Then call: keymap(mode, keymap, command, getOptions("some randome desc")

local map = vim.keymap.set

map("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)
map("n", "<C-i>", "<C-i>", opts)

map("n", "Q", "<cmd>bdelete!<CR>", opts)
map("n", "W", "<cmd>write<CR>", opts)

-- Move Lines
map("n", "<A-j>", ":m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", ":m .-2<cr>==", { desc = "Move up" })
-- map("i", "<A-j>", "<esc>:m .+1<cr>==gi", { desc = "Move down" })
-- map("i", "<A-k>", "<esc>:m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Buffers
map("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<Tab>", ":BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", ":e #<cr>", { desc = "Switch to Other buffer" })

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Dont move cursor after yank
map({ "v", "x" }, "y", "ygv<ESC>", { desc = "Yank" })

map("n", "vv", "V", { desc = "Visual line mode" })

map("i", "jk", "<ESC>", { desc = "Change to Normal Mode" })

-- Dont yank after visual paste
map("x", "p", [["_dP]])

-- LSP
map("n", "gq", "<Cmd>lua require('lvim.lsp.utils').format()<CR>", opts)


M.show_documentation = function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
  elseif vim.fn.expand "%:t" == "Cargo.toml" then
    require("crates").show_popup()
  else
    vim.lsp.buf.hover()
  end
end
vim.api.nvim_set_keymap("n", "K", ":lua require('user.keymaps').show_documentation()<CR>", opts)

return M
