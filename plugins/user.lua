local function get_copilot_node_command()
  local copilot_node_command = os.getenv "COPILOT_NODE_COMMAND"

  if copilot_node_command == nil or copilot_node_command == "" then copilot_node_command = "node" end

  return copilot_node_command
end

return {
  {
    "windwp/nvim-autopairs",
    enabled = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup {
        defaults = {
          file_ignore_patterns = {
            "renv/library",
            ".Rproj.user",
            ".git/",
          },
          mappings = {
            n = {
              ["jj"] = "close",
              ["jk"] = "close",
              ["JJ"] = "close",
              ["JK"] = "close",
            },
          },
        },
      }
    end,
  },
  {
    "ojroques/nvim-osc52",
    config = function()
      require("osc52").setup()
      local function copy()
        if vim.v.event.operator == "y" and vim.v.event.regname == "c" then require("osc52").copy_register "c" end
      end

      vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
    end,
    event = "VeryLazy",
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    event = "User AstroGitFile",
    cmd = "Neogit",
    opts = {
      auto_show_console = false,
    },
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      on_open = function(term) vim.api.nvim_del_keymap("t", "<C-j>") end,
      on_close = function(term)
        vim.api.nvim_set_keymap("t", "<C-j>", "<Cmd>wincmd j<CR>", { desc = "Terminal down window navigation" })
      end,
    },
  },
  {
    "max397574/better-escape.nvim",
    opts = {
      mapping = { "jk", "jj", "JK", "JJ" },
    },
  },
  {
    "AndrewRadev/bufferize.vim",
    cmd = "Bufferize",
  },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      copilot_node_command = get_copilot_node_command(),
      filetypes = {
        yaml = true,
      },
    },
  },
  {
    "vim-voom/VOoM",
    ft = { "rmd" },
  },

  -- -- this is to find which plugin causes the problem
  -- { "aerial.nvim", enabled = false },
  -- { "alpha-nvim", enabled = false },
  -- { "astrotheme", enabled = false },
  -- { "cmp-buffer", enabled = false },
  -- { "cmp-dap", enabled = false },
  -- { "cmp-nvim-lsp", enabled = false },
  -- { "cmp-path", enabled = false },
  -- { "cmp_luasnip", enabled = false },
  -- { "copilot.lua", enabled = false },
  -- { "friendly-snippets", enabled = false },
  -- { "guess-indent.nvim", enabled = false },
  -- { "heirline.nvim", enabled = false },
  -- { "indent-blankline.nvim", enabled = false },
  -- { "lspkind.nvim", enabled = false },
  -- { "LuaSnip", enabled = false },
  -- { "mason-lspconfig.nvim", enabled = false },
  -- { "mason-null-ls.nvim", enabled = false },
  -- { "mason-nvim-dap.nvim", enabled = false },
  -- { "mason.nvim", enabled = false },
  -- { "neoconf.nvim", enabled = false },
  -- { "neodev.nvim", enabled = false },
  -- { "null-ls.nvim", enabled = false },
  -- { "nvim-autopairs", enabled = false },
  -- { "nvim-cmp", enabled = false },
  -- { "nvim-colorizer.lua", enabled = false },
  -- { "nvim-dap", enabled = false },
  -- { "nvim-dap-ui", enabled = false },
  -- { "nvim-lspconfig", enabled = false },
  -- { "nvim-osc52", enabled = false },
  -- -- { "Nvim-R", enabled = false },
  -- { "nvim-treesitter", enabled = false },
  -- { "nvim-treesitter-textobjects", enabled = false },
  -- { "nvim-ts-autotag", enabled = false },
  -- { "nvim-ts-context-commentstring", enabled = false },
  -- { "nvim-ufo", enabled = false },
  -- { "nvim-web-devicons", enabled = false },
  -- { "plenary.nvim", enabled = false },
  -- { "promise-async", enabled = false },
  -- { "rainbow-delimiters.nvim", enabled = false },
  -- { "telescope-fzf-native.nvim", enabled = false },
  -- { "telescope.nvim", enabled = false },
  -- { "which-key.nvim", enabled = false },
}
