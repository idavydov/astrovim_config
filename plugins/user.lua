return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "jalvesaq/Nvim-R",
    ft = { "r", "rmd", "rdoc", "quarto" },
    keys = {
      {
        "<LocalLeader>pr",
        '<cmd>call g:SendCmdToR(\'params <- lapply(knitr::knit_params(readLines("\' . expand("%") . \'")), function(x) x$value); class(params) <- "knit_param_list"\')<CR>',
      },
    },
  },
  {
    "rcarriga/nvim-notify",
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
            ".git",
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
}
