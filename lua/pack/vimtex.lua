local G = require('G')
local M = {}

function M.config()
    vim.cmd([[
    let maplocalleader=" "
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
    " set conceallevel=1
    " let g:tex_conceal='abdmg'
    ]])
end

function M.setup()
    -- do nothing
end


return M
