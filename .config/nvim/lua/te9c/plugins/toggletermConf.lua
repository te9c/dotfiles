require("toggleterm").setup{
    open_mapping = [[<c-t>]],
    autochdir = true,
    direction = 'float'
}

function Compilecpp ()
    local file = vim.api.nvim_eval("expand('%:p')")
    local outputFile = vim.api.nvim_eval("expand('%:r')")
    local cmdStr = "'g++ -std=c++11 " .. file ..  " -o " .. outputFile .. " && " .. outputFile .. "'"

    -- local termExec = "TermExec cmd=" .. cmdStr .. "'"
    local termExec = string.format("TermExec cmd=%s",cmdStr)
    -- local cmdExec = 'exe v:count1 . ' .. termExec
    -- local cmdExec = string.format('exe v:count1 . %s',termExec)
    vim.cmd(termExec)
end

vim.cmd("autocmd filetype cpp nnoremap <leader>cb :w <bar> lua Compilecpp()<cr>")
