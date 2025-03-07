-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rmd", "quarto" },
  callback = function()
    -- Remove the colon trigger so that typing ":" won't cause reindentation
    vim.opt_local.indentkeys:remove "<:>"
    vim.opt_local.indentkeys:append ")"
  end,
})
