local M = {
    'numToStr/Comment.nvim',
    lazy = false,
}

function M.config()
    require("Comment").setup()
end

return M
