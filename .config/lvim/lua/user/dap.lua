-- C++ --
local dap = require("dap")

-- dap.adapters.codelldb = {
--   type = 'server',
--   host = '127.0.0.1',
--   port = 13000 -- 💀 Use the port printed out or specified with `--port`
-- }

-- dap.adapters.codelldb = {
--   type = 'server',
--   -- port = "${port}",
--   host = '127.0.0.1',
--   port = 13000,
--   executable = {
--     -- CHANGE THIS to your path!
--     -- command = '/absolute/path/to/codelldb/extension/adapter/codelldb',
--     command = '/Users/zealzel/.local/share/lvim/mason/packages/codelldb/codelldb',
--     args = { "--port", "${port}" },
--   }
-- }
-- dap.configurations.cpp = {
--   {
--     name = "Launch file",
--     type = "codelldb",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--   },
-- }



dap.adapters.lldb = {
  type = "executable",
  command = "/usr/local/opt/llvm/bin/lldb-vscode",
  -- command = "/usr/bin/lldb",
  env = {
    LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
  },
  name = "lldb",
}
local dap = require("dap")
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
    -- target = "arm64",
    -- targetArchitecture = "x86_64",
  },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
