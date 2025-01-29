vim.cmd [[
  autocmd BufNewFile,BufRead justfile set filetype=just
  ]]

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*tex",
  callback = function()
    vim.filetype.add {
      tex = "tex",
    }
  end,
})
