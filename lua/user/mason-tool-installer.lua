require("mason-tool-installer").setup {

  ensure_installed = {
    "vim-language-server",
    "angular-language-server",
    "stylua",
    "shellcheck",
    "eslint_d",
    "typescript-language-server",
    "prettierd",
    "luacheck",
    "shellcheck",
    "intelephense",
    "shfmt",
    "clangd",
    -- "clang-format",
    "php-debug-adapter",
    "jdtls",
  },

  -- if set to true this will check each tool for updates. If updates
  -- are available the tool will be updated. This setting does not
  -- affect :MasonToolsUpdate or :MasonToolsInstall.
  -- Default: false
  auto_update = true,

  -- automatically install / update on startup. If set to false nothing
  -- will happen on startup. You can use :MasonToolsInstall or
  -- :MasonToolsUpdate to install tools and check for updates.
  -- Default: true
  run_on_start = true,

  -- set a delay (in ms) before the installation starts. This is only
  -- effective if run_on_start is set to true.
  -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
  -- Default: 0
  start_delay = 1000, -- 3 second delay
}