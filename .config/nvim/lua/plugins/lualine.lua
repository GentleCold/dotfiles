return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "arkav/lualine-lsp-progress",
  },
  event = "VeryLazy",
  opts = function()
    return {
      options = {
        icons_enabled = true,
        theme = "onedark",
        component_separators = { left = "|", right = "|" },
        -- square
        section_separators = { left = "", right = "" },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          "diff",
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", hint = " ", info = " " },
          },
        },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat" },
        lualine_y = {
          {
            function()
              local msg = ""
              local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
              local clients = vim.lsp.get_active_clients()
              if next(clients) == nil then
                return msg
              end
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return client.name
                end
              end
              return msg
            end,
            icon = " ",
            -- color = { fg = "#ffffff", gui = "bold" },
          },
          {
            function()
              -- local function tableToString(tbl)
              -- 	local result = {}
              -- 	for key, value in pairs(tbl) do
              -- 		if type(value) == "table" then
              -- 			table.insert(result, tostring(key) .. " = " .. tableToString(value))
              -- 		else
              -- 			table.insert(result, tostring(key) .. " = " .. tostring(value))
              -- 		end
              -- 	end
              -- 	return "{" .. table.concat(result, ", ") .. "}"
              -- end
              local msg = ""
              local table = require("conform").list_formatters(vim.api.nvim_get_current_buf())
              local has = false
              for _, formatter in ipairs(table) do
                if has == false then
                  has = true
                  msg = formatter["name"]
                  goto continue
                end
                msg = msg .. ", " .. formatter["name"]
                  ::continue::
              end
              if has then
                return msg
              else
                return ""
              end
            end,
            -- formater
            icon = " ",
          },
          {
            function()
              local linters = require("lint").get_running(0)
              if #linters == 0 then
                return ""
              end
              return "" .. table.concat(linters, ", ")
            end,
            -- lint
            icon = " ",
          },
          {
            "lsp_progress",
            display_components = { "spinner" },
          },
        },
        lualine_z = { "progress" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { "neo-tree", "lazy", "fzf" },
    }
  end,
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
