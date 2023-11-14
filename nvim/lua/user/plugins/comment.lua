local M = {
    'numToStr/Comment.nvim',
    lazy = false,
}

function M.config()
    require("Comment").setup({
        ignore = '^$',
        toggler = {
            line = '<leader>cc',
            block = '<leader>bc',
        },
        opleader = {
            line = '<leader>c',
            block = '<leader>b',
        },
    })
end

return M
