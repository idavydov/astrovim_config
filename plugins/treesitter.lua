return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      "lua",
      -- "markdown",
      -- "r",
    })
    opts.highlight.disable = function(lang, bufnr)
      local bufFiletype = vim.fn.getbufvar(bufnr, "&filetype")
      -- print(bufFiletype)
      -- print(lang)
      if lang == "markdown" and bufFiletype == "rmd" then return true end
      if vim.api.nvim_buf_line_count(bufnr) > 10000 then return true end
    end
    opts.indent.disable = function(lang, bufnr)
      local bufFiletype = vim.fn.getbufvar(bufnr, "&filetype")
      -- print(bufFiletype)
      -- print(lang)
      if lang == "markdown" and bufFiletype == "rmd" then return true end
    end
  end,
}
