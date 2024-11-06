return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>vc"] = { "<cmd>w !diff % -<cr>", desc = "view buffer changes" },

          -- scroll other window with M-j/k
          ["<M-j>"] = { "<c-w>w<c-e><c-w>w", desc = "scroll down other window" },
          ["<M-k>"] = { "<c-w>w<c-y><c-w>w", desc = "scroll up other window" },

          -- scroll other window with M-u/d
          ["<M-u>"] = { "<c-w>w<c-u><c-w>w", desc = "scroll up other window" },
          ["<M-d>"] = { "<c-w>w<c-d><c-w>w", desc = "scroll down other window" },
        },
      },
    },
  },
}
