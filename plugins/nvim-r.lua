return {
  "jalvesaq/Nvim-R",
  ft = { "r", "rmd", "rdoc", "quarto" },
  keys = {
    {
      "<LocalLeader>pr",
      '<cmd>call g:SendCmdToR(\'params <- lapply(knitr::knit_params(readLines("\' . expand("%") . \'")), function(x) x$value); class(params) <- "knit_param_list"\')<CR>',
      desc = "read params from the YAML header",
    },
    {
      "<LocalLeader>au",
      "<cmd>call g:SendCmdToR('arvupload::arv_upload_report(\"' . expand(\"%\") . '\");')<CR>",
      desc = "upload report to Arvados",
    },
  },
  init = function()
    vim.g.R_assign = 1
    vim.g.R_nvimpager = "tab"
    vim.g.R_assign_map = "<M-->"
    vim.g.R_close_term = 1
    vim.g.R_openhtml = 0
    vim.g.R_args = { "--quiet", "--no-save", "--no-restore" }

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
    vim.g.rout_color_error = "guifg=#ffffff guibg=#c64343"
    vim.g.rout_color_warn = "guifg=#c64343"
    vim.g.rout_color_index = "guifg=#9854f1"
  end,
}
