vim.cmd [[
  autocmd BufNewFile,BufRead justfile set filetype=make
  ]]

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*tex",
  callback = function()
    vim.filetype.add {
      tex = "tex",
    }
  end,
})
