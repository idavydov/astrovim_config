return {
  {
    "R-nvim/R.nvim",
    branch = "main",
    lazy = false,
    config = function() -- Create a table with the options to be passed to setup()
      local opts = {

        nvimpager = "tab",
        close_term = false,
        open_html = "open",
        open_pdf = "no",
        pdfviewer = "",
        view_df = {
          open_app = "tmux new-window vd --themee=light",
          n_lines = 10000000,
        },
        -- set_params = "no",
        quarto_preview_args = ", port=.free_port()",
        rmdchunk = 0,
        R_args = { "--quiet", "--no-save", "--no-restore" },
        hook = {
          on_filetype = function()
            -- This function will be called at the FileType event
            -- of files supported by R.nvim. This is an
            -- opportunity to create mappings local to buffers.
            vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
            vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
          end,
        },
        min_editor_width = 72,
        rconsole_width = 78,
        disable_cmds = {
          "RCustomStart",
          "RSaveClose",
          "RPackages",
        },
      }
      if vim.env.R_AUTO_START == "1" then opts.auto_start = "on startup" end
      require("r").setup(opts)
    end,
    keys = {
      -- rmd
      {
        "<LocalLeader>pr",
        "<cmd>lua require('r.send').cmd('params <- lapply(knitr::knit_params(readLines(\"' .. vim.fn.expand(\"%:p\") .. '\")), function(x) x$value); class(params) <- \"knit_param_list\"')<CR>",
        desc = "read params from the YAML header",
      },
      {
        "<LocalLeader>au",
        "<cmd>lua require('r.send').cmd('arvupload::arv_upload_report(\"' .. vim.fn.expand(\"%:p\") .. '\");')<CR>",
        desc = "upload report to Arvados",
      },
      {
        "]c",
        "<cmd>lua require('r.rmd').next_chunk()<CR>",
        desc = "Next chunk",
      },
      {
        "[c",
        "<cmd>lua require('r.rmd').previous_chunk()<CR>",
        desc = "Previous chunk",
      },
      {
        "<LocalLeader>ci",
        "o```{r}\n```<Esc>ko",
        desc = "Insert chunk",
      },
      -- renv
      {
        "<LocalLeader>er",
        "<cmd>lua require('r.send').cmd('renv::load()')<CR>",
        desc = "load renv",
      },

      -- pkg dev
      {
        "<LocalLeader>pb",
        "<cmd>lua require('r.send').cmd('pkgdown::build_site()')<CR>",
        desc = "pkgdown build site",
      },
      {
        "<LocalLeader>el",
        "<cmd>lua require('r.send').cmd('devtools::build_all()')<CR>",
        desc = "devtools load all",
      },
      {
        "<LocalLeader>ed",
        "<cmd>lua require('r.send').cmd('devtools::document()')<CR>",
        desc = "devtools document",
      },
      {
        "<LocalLeader>ei",
        "<cmd>lua require('r.send').cmd('devtools::install()')<CR>",
        desc = "devtools install",
      },
      -- object properties
      {
        "<LocalLeader>in",
        "<cmd>lua require('r.run').action('length')<CR>",
        desc = "length",
      },
      {
        "<LocalLeader>il",
        "<cmd>lua require('r.run').action('levels')<CR>",
        desc = "levels",
      },
      {
        "<LocalLeader>iu",
        "<cmd>lua require('r.run').action('unique')<CR>",
        desc = "unique",
      },
      -- data.frame's
      {
        "<LocalLeader>ir",
        "<cmd>lua require('r.run').action('nrow')<CR>",
        desc = "nrow",
      },
      {
        "<LocalLeader>ig",
        "<cmd>lua require('r.run').action('glimpse')<CR>",
        desc = "glimpse",
      },
      {
        "<LocalLeader>it",
        "<cmd>lua require('r.run').action('(\\\\(x) t(x[1,]))')<CR>",
        desc = "t(x[1,])",
      },
      {
        "<LocalLeader>ic",
        "<cmd>lua require('r.run').action('dplyr::count', 'n',  ', ' .. vim.fn.input('column(s)?'))<CR>",
        desc = "count",
      },
      {
        "<LocalLeader>id",
        "<cmd>lua require('r.run').action('dplyr::distinct', 'n', ', ' .. vim.fn.input('column(s)?'))<CR>",
        desc = "distinct",
      },
      {
        "<LocalLeader>ip",
        "<cmd>lua require('r.run').action('dplyr::pull', 'n', ', ' .. vim.fn.input('column?'))<CR>",
        desc = "pull",
      },

      -- print assignent
      {
        "<LocalLeader>pv",
        "<cmd>lua require('r.send').paragraph(false)<CR>" .. "<cmd>lua require('r.send').cmd('print(.Last.value)')<CR>",
        desc = "send paragraph and view result",
      },
      {
        "<S-CR>",
        "<cmd>lua require('r.send').line(false)<CR>" .. "<cmd>lua require('r.send').cmd('print(.Last.value)')<CR>",
        desc = "send line and view result",
      },

      -- browse files
      {
        "<LocalLeader>br",
        "<cmd>lua require('r.send').cmd('servr::httd(port=.free_port())')<CR>",
        desc = "file browser",
      },

      -- graphic device
      {
        "<LocalLeader>gd",
        "<cmd>lua require('r.send').cmd('tryCatch(httpgd::hgd_browse(),error=function(e) {httpgd::hgd(port=.free_port());httpgd::hgd_browse()})')<CR>",
        desc = "httpgd",
      },
    },
    init = function()
      vim.g.R_assign = 1
      vim.g.R_nvimpager = "tab"
      vim.g.R_assign_map = "<M-->"
      vim.g.R_close_term = 1
      vim.g.R_args = { "--quiet", "--no-save", "--no-restore" }
      vim.g.R_csv_app = ':lua require("astronvim.utils").toggle_term_cmd("vd --theme=light %s")'

      vim.g.r_indent_align_args = 0
      -- vim.g.rout_follow_colorscheme = 1
      vim.g.rout_color_input = "guifg=#7890dd"
      vim.g.rout_color_normal = "guifg=#2e7de9"
      vim.g.rout_color_number = "guifg=#b15c00"
      vim.g.rout_color_integer = "guifg=#b15c00"
      vim.g.rout_color_float = "guifg=#b15c00"
      vim.g.rout_color_complex = "guifg=#b15c00"
      vim.g.rout_color_negnum = "guifg=#118c74"
      vim.g.rout_color_negfloat = "guifg=#118c74"
      vim.g.rout_color_date = "guifg=#387068"
      vim.g.rout_color_true = "guifg=#00d7af"
      vim.g.rout_color_false = "guifg=#ff5d5e"
      vim.g.rout_color_inf = "guifg=#188092"
      vim.g.rout_color_constant = "guifg=#188092"
      vim.g.rout_color_string = "guifg=#587539"
      vim.g.rout_color_error = "guifg=#e9e9ec guibg=#c64343"
      vim.g.rout_color_warn = "guifg=#c64343"
      vim.g.rout_color_index = "guifg=#9854f1"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline", "r", "rnoweb", "yaml" })
      opts.highlight.enable = true
    end,
  },
  {
    "R-nvim/cmp-r",
    opts = {
      filetypes = { "r", "rmd", "quarto" },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts) table.insert(opts.sources, { name = "cmp_r" }) end,
  },
}
