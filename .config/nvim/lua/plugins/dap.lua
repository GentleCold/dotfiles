return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- fancy UI for the debugger
      {
        "rcarriga/nvim-dap-ui",
        -- stylua: ignore
        keys = {
          { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
          { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
        },
        opts = {},
        config = function(_, opts)
          -- setup dap config by VsCode launch.json file
          -- require("dap.ext.vscode").load_launchjs()
          local dap = require("dap")
          local dapui = require("dapui")
          dapui.setup(opts)
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
          end
        end,
      },

      -- virtual text for the debugger
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
      { "nvim-neotest/nvim-nio" },
    },
    -- stylua: ignore
    keys = {
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
      { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end, desc = "Down" },
      { "<leader>dk", function() require("dap").up() end, desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end, desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },
    config = function()
      local dap = require("dap")

      -- NOTE: PYTHON
      dap.adapters.python = function(cb, config)
        if config.request == "attach" then
          ---@diagnostic disable-next-line: undefined-field
          local port = (config.connect or config).port
          ---@diagnostic disable-next-line: undefined-field
          local host = (config.connect or config).host or "127.0.0.1"
          cb({
            type = "server",
            port = assert(port, "`connect.port` is required for a python `attach` configuration"),
            host = host,
            options = {
              source_filetype = "python",
            },
          })
        else
          cb({
            type = "executable",
            command = require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/bin/python",
            args = { "-m", "debugpy.adapter" },
            options = {
              source_filetype = "python",
            },
          })
        end
      end

      dap.configurations.python = {
        {
          -- The first three options are required by nvim-dap
          type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
          request = "launch",
          name = "Launch file",

          -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

          program = "${file}",
          args = function()
            local str = vim.fn.input("Args: ")
            local list = {}

            for word in string.gmatch(str, "%S+") do
              table.insert(list, word)
            end
            return list
          end,
          pythonPath = function()
            return os.getenv("VIRTUAL_ENV") .. "/bin/python"
          end,
        },
      }

      -- NOTE: C/CPP
      if not dap.adapters["codelldb"] then
        require("dap").adapters["codelldb"] = {
          type = "server",
          port = "${port}",
          executable = {
            command = require("mason-registry").get_package("codelldb"):get_install_path()
              .. "/extension/adapter/codelldb",
            args = {
              "--port",
              "${port}",
            },
          },
        }
      end

      dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = "/home/gentle/downloads/tmp/extension/debugAdapters/bin/OpenDebugAD7",
      }

      local pickers = require("telescope.pickers")
      local finders = require("telescope.finders")
      local conf = require("telescope.config").values
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      for _, lang in ipairs({ "c", "cpp" }) do
        dap.configurations[lang] = {
          {
            -- type = "codelldb",
            type = "cppdbg",
            request = "launch",
            name = "Launch file",

            -- program = function()
            --   return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            -- end,
            program = function()
              return coroutine.create(function(coro)
                local opts = {}
                pickers
                  .new(opts, {
                    prompt_title = "Path to executable",
                    sorter = conf.generic_sorter(opts),
                    finder = finders.new_oneshot_job({ "fd", "--no-hidden", "--no-ignore-vcs", "--type", "x" }, {}),
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

            args = function()
              local str = vim.fn.input("Args: ")
              local list = {}

              for word in string.gmatch(str, "%S+") do
                table.insert(list, word)
              end
              return list
            end,

            cwd = "${workspaceFolder}",
            -- stopOnEntry = false,
            stopOnEntry = true,
            setupCommands = {
              {
                text = "-enable-pretty-printing",
                description = "enable pretty printing",
                ignoreFailures = false,
              },
            },
          },
        }
      end

      -- NOTE: GOLAND
      dap.adapters.delve = {
        type = "server",
        port = "${port}",
        executable = {
          command = "dlv",
          args = { "dap", "-l", "127.0.0.1:${port}" },
        },
      }

      -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
      dap.configurations.go = {
        {
          type = "delve",
          name = "Debug",
          request = "launch",
          program = "${file}",
          args = function()
            local str = vim.fn.input("Args: ")
            local list = {}

            for word in string.gmatch(str, "%S+") do
              table.insert(list, word)
            end
            return list
          end,
        },
      }
    end,
  },
}
