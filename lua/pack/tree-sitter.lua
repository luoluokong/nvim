local G = require('G')
local M = {}

function M.parser_bootstrap()
    local parsers = require("nvim-treesitter.parsers")
    local lang = parsers.ft_to_lang(G.api.nvim_eval('&ft'))
    local has_parser = parsers.has_parser(lang)
    if not has_parser then
        G.cmd("try | call execute('TSInstall " .. lang .. "') | catch | endtry")
    end
end

function M.config()
    G.hi({
        ["@variable"] = { fg = "NONE" };
        ["@function"] = { fg = 32 };
        ["@function.call"] = { fg = 32 };
        ["@operator"] = { fg = 166 };
        ["@keyword.operator"] = { fg = 166 };

        ["@property"] = { fg = 172 };
        ["@field"] = { fg = 150 };
        ["@method"] = { fg = 166 };
        ["@method.call"] = { fg = 9 };
        ["@parameter"] = { fg = 9 };

        ["@keyword"] = { fg = 1 };
        ["@keyword.function"] = { fg = 32 };
        ["@exception"] = { fg = 32 };

        ["@statement"] = { fg = 166 };
        ["@special"] = { fg = 172 };
        ["@comment"] = { fg = 71, italic = true };
        ["@include"] = { fg = 1 };
        ["@type"] = { fg = 179 };
        ["@type.builtin"] = { fg = 150 };
        ["@punctuation.bracket"] = { fg = 151 };

        ["@constructor"] = { fg = 172 };
        ["@namespace"] = { fg = 172 };

        ["@string"] = { fg = 37 };
        ["@number"] = { fg = 37 };
        ["@boolean"] = { fg = 37 };

        ["@tag"] = { fg = 172 };
        ["@tag.attribute"] = { fg = 166 };
        ["@tag.delimiter"] = { fg = 150 };
        ["@conditional.ternary"] = { fg = 1 };
        ["@punctuation.special"] = { fg = 166 };

        ["@text.literal"] = { fg = 7 };

        ["@text.todo.unchecked"] = { fg = 172 };
        ["@text.todo.checked"] = { fg = 37 };
    })
    G.map({
        { 'n', 'H', ':TSHighlightCapturesUnderCursor<CR>', { silent = true, noremap = true } },
        { 'n', 'R', ':write | edit | TSBufEnable highlight<CR>', { silent = true, noremap = true } },
    })

    -- some custom highlights
    G.hi({
        Todo = { fg = 234, bg = 38, bold = true };
        TodoText = { fg = 38, bg = 'NONE', bold = true };
        Note = { fg = 234, bg = 78, bold = true };
        NoteText = { fg = 78, bg = 'NONE', bold = true };
    })
    G.cmd([[call matchadd('Todo', '\s\{0,1\}TODO:\{0,1\}\s\{0,1\}')]])
    G.cmd([[call matchadd('TodoText', '\s\{0,1\}TODO:\{0,1\}\s\{0,1\}\zs.*')]])
    G.cmd([[call matchadd('Note', '\s\{0,1\}NOTE:\{0,1\}\s\{0,1\}')]])
    G.cmd([[call matchadd('NoteText', '\s\{0,1\}NOTE:\{0,1\}\s\{0,1\}\zs.*')]])
end

function M.setup()
    require('nvim-treesitter.configs').setup({
        -- 列举常用语言自动安装parser
        ensure_installed = { 'lua', 'markdown', 'c', 'rust' },
        highlight = {
            enable = true
        },
    })
    -- M.parser_bootstrap() -- 跟vimtex冲突
    -- G.cmd([[ au FileType * lua require('pack/tree-sitter').parser_bootstrap() ]])
end

return M
