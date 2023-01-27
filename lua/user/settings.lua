-- vim.notify = require("notify")


local host = vim.loop.os_uname().sysname

if host == "Linux" then
  require("user.linux")
  return
end

require("user.windows")
