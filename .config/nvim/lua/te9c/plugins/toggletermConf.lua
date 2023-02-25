require("toggleterm").setup{
    open_mapping = [[<c-t>]],
    autochdir = true,
    direction = 'float'
}

function Compilecpp ()
    local file = vim.fn.expand('%:p')
    local outputFile = vim.fn.expand('%:p:r')
    local cmdStr = "'g++ -std=c++11 -g " .. file ..  " -o " .. outputFile .. " && " .. outputFile .. "'"

    -- local termExec = "TermExec cmd=" .. cmdStr .. "'"
    local termExec = string.format("TermExec cmd=%s",cmdStr)
    -- local cmdExec = 'exe v:count1 . ' .. termExec
    -- local cmdExec = string.format('exe v:count1 . %s',termExec)
    vim.cmd(termExec)
end

vim.api.nvim_create_autocmd("FileType",{
    pattern = "cpp",
    callback = function (args)
        vim.keymap.set("n","<leader>cb",function () Compilecpp() end,{buffer = args.buf})
    end
})
