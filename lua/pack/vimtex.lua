local G = require('G')
local M = {}

function M.config()
    vim.cmd([[
    let maplocalleader=" "
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
    let g:vimtex_compiler_progname='nvr'
    " set conceallevel=1
    " let g:tex_conceal='abdmg'
    ]])
end

function M.setup()
    -- do nothing
end


return M
