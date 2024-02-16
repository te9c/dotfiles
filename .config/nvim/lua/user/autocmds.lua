-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(args)
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--         if client.name == "omnisharp" then
--             vim.keymap.set("n", "gd", function()
--                 vim.lsp.buf.definition()
--             end, { desc = "Go to defenition" })
--         end
--     end,
-- })
-- Require changes in astronvim/utils/lsp.lua
-- then change gd to vim.lsp.buf.defenition()

-- C++ Compile and run
function StripExtension(path)
    return path:sub(0, #path - 4)
end

function GetFileName(url)
    return url:match("^.+/(.+)$")
end

local compilatorCommand = "g++"
local compilationArgs = {
    "-g",
    "-Wall",
    "-Wextra",
    "-std=c++2a",
}
local direction = "float"

-- local outputPath = "/tmp/" .. GetFileName(StripExtension(vim.api.nvim_buf_get_name(0)))
-- local outputPath = StripExtension(vim.api.nvim_buf_get_name(0))

local Compile = function()
    local outputPath = StripExtension(vim.api.nvim_buf_get_name(0))
    local cmd = compilatorCommand .. " "
    for _, v in pairs(compilationArgs) do
        cmd = cmd .. v .. " "
    end
    local path = vim.api.nvim_buf_get_name(0)
    cmd = cmd .. path .. " -o " .. outputPath
    vim.cmd('TermExec cmd="' .. cmd .. '" direction="' .. direction .. '"')
end

local CompileAndRunCpp = function()
    local outputPath = StripExtension(vim.api.nvim_buf_get_name(0))
    local cmd = compilatorCommand .. " "
    for _, v in pairs(compilationArgs) do
        cmd = cmd .. v .. " "
    end
    local path = vim.api.nvim_buf_get_name(0)
    cmd = cmd .. path .. " -o " .. outputPath .. " && " .. outputPath

    -- local run = Terminal:new({ cmd = cmd, direction = 'float',})
    vim.cmd('TermExec cmd="' .. cmd .. '" direction="' .. direction .. '"')
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.cpp" },
    desc = "Compile and run cpp file",
    callback = function()
        vim.keymap.set("n", "<leader>tr", CompileAndRunCpp, { desc = "ToggleTerm compile and run" })
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.cpp" },
    desc = "Compile cpp file",
    callback = function()
        vim.keymap.set("n", "<leader>tc", Compile, { desc = "ToggleTerm compile" })
    end,
})
