-- In this file you need four things to setup:
-- NOTE: 1. All tools that downloaded from mason
local language_servers = {
  -- markdown
  "alex",
  "prettier",

  -- bash
  "bash-language-server",
  "shfmt",

  -- lua
  "stylua",
  "lua-language-server",

  -- c/cpp
  "clangd",
  "clang-format",

  -- cmake
  "cmake-language-server",
  "cmakelang",

  -- python
  "pyright",
  "python-lsp-server",
  "isort",
  "black",
  "flake8",
}

-- NOTE: 2. formatters
local formatters = {
  lua = { "stylua" },
  python = { "isort", "black" },
  javascript = { { "prettier" } },
  markdown = { { "prettier" } },
  c = { "clang_format" },
  cpp = { "clang_format" },
  cmake = { "cmake_format" },
  sh = { "shfmt" },
}

-- NOTE: 3. linters
local linters = {
  fish = { "fish" },
  -- c = { "clangtidy" },
  -- cpp = { "clangtidy" },
  markdown = { "alex" },
  -- python = { "flake8" },
}

local lsp_setup = function()
  require("neodev").setup()
  require("mason-lspconfig").setup()

  -- ui
  local border = {
    { "┌", "FloatBorder" },
    { "─", "FloatBorder" },
    { "┐", "FloatBorder" },
    { "│", "FloatBorder" },
    { "┘", "FloatBorder" },
    { "─", "FloatBorder" },
    { "└", "FloatBorder" },
    { "│", "FloatBorder" },
  }

  -- LSP settings (for overriding per client)
  local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
  }

  -- To instead override globally
  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
  ---@diagnostic disable-next-line: duplicate-set-field
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
  end

  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- NOTE: 4. Set up lspconfig
  require("lspconfig").lua_ls.setup({
    handlers = handlers,
    capabilities = capabilities,
  })
  require("lspconfig").clangd.setup({
    handlers = handlers,
    capabilities = capabilities,
  })
  require("lspconfig").pyright.setup({
    handlers = handlers,
    capabilities = capabilities,
  })
  -- require("lspconfig").pylsp.setup({
  --   -- handlers = handlers,
  --   -- capabilities = capabilities,
  --   settings = {
  --     pylsp = {
  --       plugins = {
  --         pycodestyle = {
  --           ignore = { "W391", "E203" },
  --           maxLineLength = 100,
  --         },
  --         pyflakes = {
  --           enabled = false,
  --         },
  --       },
  --     },
  --   },
  -- })
  require("lspconfig").bashls.setup({
    handlers = handlers,
    capabilities = capabilities,
  })
  require("lspconfig").cmake.setup({
    handlers = handlers,
    capabilities = capabilities,
  })
  require("lspconfig").jdtls.setup({})
end

return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ensure_installed = language_servers,
    },
    config = function(_, opts)
      require("mason").setup(opts)

      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
  -- bundle of java
  {
    "nvim-java/nvim-java",
    ft = { "java" },
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
          },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
    },
    config = function()
      -- java config
      require("java").setup()

      -- autocmd
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
        end,
      })

      -- diagnostic
      vim.diagnostic.config({
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- for _, diag in ipairs({ "Error", "Warn", "Info", "Hint" }) do
      --   vim.fn.sign_define("DiagnosticSign" .. diag, {
      --     text = "",
      --     texthl = "DiagnosticSign" .. diag,
      --     linehl = "",
      --     numhl = "DiagnosticSign" .. diag,
      --   })
      -- end

      -- signs
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
      lsp_setup()
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>fm",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
      {
        "<leader>af",
        "<cmd>FormatToggle<cr>",
        mode = "n",
        desc = "Toggle format on save",
      },
    },
    opts = {
      -- Define your formatters
      formatters_by_ft = formatters,
      -- Set up format-on-save
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end, -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    config = function(_, opts)
      -- vim.g.disable_autoformat = true

      require("conform").setup(opts)
      vim.api.nvim_create_user_command("FormatToggle", function(args)
        if vim.g.disable_autoformat or vim.b.disable_autoformat then
          vim.g.disable_autoformat = false
          ---@diagnostic disable-next-line: inject-field
          vim.b.disable_autoformat = false
          print("Autoformat enabled")
        else
          if args.bang then
            -- FormatDisable! will disable formatting just for this buffer
            ---@diagnostic disable-next-line: inject-field
            vim.b.disable_autoformat = true
          else
            vim.g.disable_autoformat = true
          end
          print("Autoformat disabled")
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      -- Event to trigger linters
      events = { "TextChanged", "BufEnter", "InsertLeave" },
      linters_by_ft = linters,
      -- LazyVim extension to easily override linter options
      -- or add custom linters.
      ---@type table<string,table>
      linters = {
        -- -- Example of using selene only when a selene.toml file is present
        -- selene = {
        --   -- `condition` is another LazyVim extension that allows you to
        --   -- dynamically enable/disable linters based on the context.
        --   condition = function(ctx)
        --     return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
        --   end,
        -- },
      },
    },
    config = function(_, opts)
      local M = {}
      local lint = require("lint")
      for name, linter in pairs(opts.linters) do
        if type(linter) == "table" and type(lint.linters[name]) == "table" then
          lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name], linter)
        else
          lint.linters[name] = linter
        end
      end
      lint.linters_by_ft = opts.linters_by_ft

      function M.debounce(ms, fn)
        local timer = vim.loop.new_timer()
        return function(...)
          local argv = { ... }
          timer:start(ms, 0, function()
            timer:stop()
            vim.schedule_wrap(fn)(unpack(argv))
          end)
        end
      end

      function M.lint()
        -- Use nvim-lint's logic first:
        -- * checks if linters exist for the full filetype first
        -- * otherwise will split filetype by "." and add all those linters
        -- * this differs from conform.nvim which only uses the first filetype that has a formatter
        local names = lint._resolve_linter_by_ft(vim.bo.filetype)

        -- Add fallback linters.
        if #names == 0 then
          vim.list_extend(names, lint.linters_by_ft["_"] or {})
        end

        -- Add global linters.
        vim.list_extend(names, lint.linters_by_ft["*"] or {})

        -- Filter out linters that don't exist or don't match the condition.
        local ctx = { filename = vim.api.nvim_buf_get_name(0) }
        ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
        names = vim.tbl_filter(function(name)
          local linter = lint.linters[name]
          return linter and not (type(linter) == "table" and linter.condition and not linter.condition(ctx))
        end, names)

        -- Run linters.
        if #names > 0 and vim.g.lint then
          lint.try_lint(names)
        end
      end

      -- local clangtidy = require("lint").linters.clangtidy
      -- clangtidy.args = {
      --   "-p ./build",
      --   "--quiet",
      -- }

      vim.api.nvim_create_autocmd(opts.events, {
        group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
        callback = M.debounce(100, M.lint),
      })
    end,
  },
}
