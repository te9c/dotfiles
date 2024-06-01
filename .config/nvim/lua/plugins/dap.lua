return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local dap = require "dap"
    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local conf = require("telescope.config").values
    local actions = require "telescope.actions"
    local action_state = require "telescope.actions.state"

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "/Users/te9c/.local/share/codelldb/extension/adapter/codelldb",
        args = { "--port", "${port}" },
      },
    }

    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return coroutine.create(function(coro)
            local opts = {}
            pickers
              .new(opts, {
                prompt_title = "Path to executable",
                finder = finders.new_oneshot_job({ "fd", "--hidden", "--no-ignore", "--type", "x" }, {}),
                sorter = conf.generic_sorter(opts),
                attach_mappings = function(buffer_number)
                  actions.select_default:replace(function()
                    actions.close(buffer_number)
                    coroutine.resume(coro, action_state.get_selected_entry()[1])
                  end)
                  return true
                end,
              })
              :find()
          end)
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
    dap.configurations.c = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return coroutine.create(function(coro)
            local opts = {}
            pickers
              .new(opts, {
                prompt_title = "Path to executable",
                finder = finders.new_oneshot_job({ "fd", "--hidden", "--no-ignore", "--type", "x" }, {}),
                sorter = conf.generic_sorter(opts),
                attach_mappings = function(buffer_number)
                  actions.select_default:replace(function()
                    actions.close(buffer_number)
                    coroutine.resume(coro, action_state.get_selected_entry()[1])
                  end)
                  return true
                end,
              })
              :find()
          end)
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
  end,
}
