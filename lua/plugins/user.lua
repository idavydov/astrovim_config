---@type LazySpec
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
              ["jk"] = "close",
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
      on_open = function() vim.api.nvim_del_keymap("t", "<C-j>") end,
      on_close = function()
        vim.api.nvim_set_keymap("t", "<C-j>", "<Cmd>wincmd j<CR>", { desc = "Terminal down window navigation" })
      end,
    },
  },
  {
    "max397574/better-escape.nvim",
    opts = {
      default_mappings = false,
      mappings = {
        i = {
          j = {
            k = "<Esc>",
          },
          J = {
            K = "<Esc>",
          },
        },
        c = {
          j = {
            k = "<Esc>",
          },
          J = {
            K = "<Esc>",
          },
        },
        t = {
          j = {
            k = "<C-\\><C-n>",
          },
          J = {
            K = "<C-\\><C-n>",
          },
        },
        v = {
          j = {
            k = "<Esc>",
          },
          J = {
            K = "<Esc>",
          },
        },
        s = {
          j = {
            k = "<Esc>",
          },
          J = {
            K = "<Esc>",
          },
        },
      },
    },
  },
  {
    "AndrewRadev/bufferize.vim",
    cmd = "Bufferize",
  },
  {
    "vim-voom/VOoM",
    ft = { "rmd" },
  },
}
