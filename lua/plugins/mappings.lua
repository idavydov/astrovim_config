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
          ["<Leader>vc"] = { "<cmd>w !diff % -<cr>", desc = "buffer changes" },
        },
      },
    },
  },
}
