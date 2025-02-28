return {
  "olimorris/codecompanion.nvim",
  config = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "copilot",
      },
      inline = {
        adapter = "copilot",
      },
    },
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "claude-3.5-sonnet",
            },
            reasoning_effort = {
              default = "high",
            },
          },
        })
      end,
    },
    display = {
      chat = {
        window = {
          layout = "float",
          width = 0.6,
        },
        show_settings = true,
      },
    },
  },
  keys = {
    { "<leader>mm", "<cmd>CodeCompanionChat Toggle<CR>", desc = "CC Chat" },
    { "<leader>ma", "<cmd>CodeCompanionActions<CR>", desc = "CC Actions" },
  },
}
