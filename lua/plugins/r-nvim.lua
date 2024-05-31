return {
  {
    "R-nvim/R.nvim",
    lazy = false,
    config = function() -- Create a table with the options to be passed to setup()
      local opts = {

        nvimpager = "tab",
        close_term = false,
        open_html = "no",
        open_pdf = "no",
        pdfviewer = "",
        csv_app = ':lua require("astronvim.utils").toggle_term_cmd("vd --theme=light %s")',

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
          "RClearConsole",
          "RCustomStart",
          "RSPlot",
          "RSaveClose",
        },
      }
      -- Check if the environment variable "R_AUTO_START" exists.
      -- If using fish shell, you could put in your config.fish:
      -- alias r "R_AUTO_START=true nvim"
      if vim.env.R_AUTO_START == "true" then
        opts.auto_start = 1
        opts.objbr_auto_start = true
      end
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
        "<cmd>call g:SendCmdToR('arvupload::arv_upload_report(\"' . expand(\"%:p\") . '\");')<CR>",
        desc = "upload report to Arvados",
      },
      {
        "]c",
        "<cmd>call b:NextRChunk()<CR>",
        desc = "Next chunk",
      },
      {
        "[c",
        "<cmd>call b:PreviousRChunk()<CR>",
        desc = "Previous chunk",
      },
      -- renv
      {
        "<LocalLeader>er",
        "<cmd>call g:SendCmdToR('renv::load()')<CR>",
        desc = "load renv",
      },

      -- pkg dev
      {
        "<LocalLeader>pb",
        "<cmd>call g:SendCmdToR('pkgdown::build_site()')<CR>",
        desc = "pkgdown build site",
      },
      {
        "<LocalLeader>el",
        "<cmd>call g:SendCmdToR('devtools::load_all()')<CR>",
        desc = "devtools load all",
      },
      {
        "<LocalLeader>ed",
        "<cmd>call g:SendCmdToR('devtools::document()')<CR>",
        desc = "devtools document",
      },
      {
        "<LocalLeader>ei",
        "<cmd>call g:SendCmdToR('devtools::install()')<CR>",
        desc = "devtools install",
      },
      -- object properties
      {
        "<LocalLeader>in",
        "<cmd>call RAction('length')<CR>",
        desc = "length",
      },
      {
        "<LocalLeader>il",
        "<cmd>call RAction('levels')<CR>",
        desc = "levels",
      },
      {
        "<LocalLeader>iu",
        "<cmd>call RAction('unique')<CR>",
        desc = "unique",
      },
      -- data.frame's
      {
        "<LocalLeader>ir",
        "<cmd>call RAction('nrow')<CR>",
        desc = "nrow",
      },
      {
        "<LocalLeader>ig",
        "<cmd>call RAction('dplyr::glimpse')<CR>",
        desc = "glimpse",
      },
      {
        "<LocalLeader>it",
        "<cmd>call RAction('(\\(x) t(x[1,]))')<CR>",
        desc = "t(x[1,])",
      },
      {
        "<LocalLeader>ic",
        "<cmd>call RAction('dplyr::count', ', ' . input('column(s)?'))<CR>",
        desc = "count",
      },
      {
        "<LocalLeader>id",
        "<cmd>call RAction('dplyr::distinct', ', ' . input('column(s)?'))<CR>",
        desc = "distinct",
      },
      {
        "<LocalLeader>ip",
        "<cmd>call RAction('dplyr::pull', ', ' . input('column?'))<CR>",
        desc = "pull",
      },
      {
        "<LocalLeader>pv",
        [[
        <cmd>call SendParagraphToR('silent', 'stay')<CR>
        <cmd>call g:SendCmdToR('nvimcom:::nvim_viewobj(.Last.value$value)')<CR>
        ]],
        desc = "send paragraph and view result",
      },
    },
    init = function()
      vim.g.R_assign = 1
      vim.g.R_nvimpager = "tab"
      vim.g.R_assign_map = "<M-->"
      vim.g.R_close_term = 1
      vim.g.R_openhtml = 0
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
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "markdown", "markdown_inline", "r", "rnoweb" },
      }
    end,
  },
  "R-nvim/cmp-r",
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("cmp").setup { sources = { { name = "cmp_r" } } }
      require("cmp_r").setup {}
    end,
  },
}
