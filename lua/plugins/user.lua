local function get_copilot_node_command()
  local copilot_node_command = os.getenv "COPILOT_NODE_COMMAND"

  if copilot_node_command == nil or copilot_node_command == "" then copilot_node_command = "node" end

  return copilot_node_command
end

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
    enabled = false,
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
}
