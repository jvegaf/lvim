local present, notify = pcall(require, "notify")

if not present then
  return
end

local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
  return
end

telescope.load_extension "notify"

vim.notify = notify
