local dapui = require("dapui")
local dap = require("dap")

-- Keymaps section --

vim.keymap.set('n','<leader>b',function () dap.toggle_breakpoint() end , {desc = "dap | toggle breakpoint"})
vim.keymap.set('n','<leader>dc',function () dap.continue() end , {desc = "dap | continue"})
vim.keymap.set('n','<C-i>',function () dap.step_into() end, {desc = "dap | step into"})
vim.keymap.set('n','<C-o>',function () dap.step_over() end, {desc = "dap | step over"})
vim.keymap.set('n', '<Leader>dl',function () dap.run_last() end, {desc = "dap | run last"})
vim.keymap.set('n','dh',function() require('dap.ui.widgets').hover() end, {desc="dap | hover"})
vim.keymap.set('n','<leader>dt',function () dap.terminate() end, {desc = "dap | terminate debug session"})

vim.keymap.set('n','<leader>du',function () dapui.toggle() end, {desc = "dap | toggle dapui"})

-- Keymaps section --

dap.adapters.lldb = {
    type = 'executable',
    command = '/home/linuxbrew/.linuxbrew/opt/llvm/bin/lldb-vscode',
    name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    -- env = function()
    --     local variables = {}
    --     for k, v in pairs(vim.fn.environ()) do
    --         table.insert(variables, string.format("%s=%s", k, v))
    --     end
    --     return variables
    -- end,

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}

dapui.setup()
