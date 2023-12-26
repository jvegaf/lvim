lvim.plugins = {
  "mfussenegger/nvim-jdtls",
  "p00f/clangd_extensions.nvim",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "HiPhish/nvim-ts-rainbow2",
  "lunarvim/synthwave84.nvim",
  "EdenEast/nightfox.nvim",
  "folke/tokyonight.nvim",
  -- "oxfist/night-owl.nvim",
  "polirritmico/monokai-nightasty.nvim",
  "stevearc/dressing.nvim",
  {
    "j-hui/fidget.nvim",
    branch = "legacy",
  },
  "windwp/nvim-ts-autotag",
  "kylechui/nvim-surround",
  "NvChad/nvim-colorizer.lua",
  "moll/vim-bbye",
  "folke/todo-comments.nvim",
  "windwp/nvim-spectre",
  "f-person/git-blame.nvim",
  "ruifm/gitlinker.nvim",
  {
    "lvimuser/lsp-inlayhints.nvim",
    branch = "anticonceal",
  },
  "lunarvim/darkplus.nvim",
  "kevinhwang91/nvim-bqf",
  "nacro90/numb.nvim",
  "sindrets/diffview.nvim",
  "simrat39/rust-tools.nvim",
  "mxsdev/nvim-dap-vscode-js",
  "petertriho/nvim-scrollbar",
  "MunifTanjim/nui.nvim",
  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup {
        highlight_on_key = true,
      }
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "hrsh7th/cmp-emoji",
    event = "BufRead",
  },
  "rmagatti/auto-session",
  "rmagatti/session-lens",
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },
  "sontungexpt/url-open",
  {
    "jvegaf/browse.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "BufReadPost",
  },
  "hedyhli/outline.nvim",
  {
    "junegunn/vim-easy-align",
    event = "BufReadPre",
    keys = { { "ga", "<Plug>(EasyAlign)", mode = { "n", "x" }, desc = "EasyAlign" } },
  },
}
