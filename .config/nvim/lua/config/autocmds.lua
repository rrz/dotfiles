-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "yaml", "gotmpl", "yml", "puppet" },
  callback = function()
    vim.bo.expandtab = true
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
})

-- detect *.helmfile as helm filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.helmfile",
  callback = function()
    vim.bo.filetype = "helm"
  end,
})

vim.filetype.add({
  extension = {
    gotmpl = "gotmpl",
  },
  pattern = {
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",
  },
})
