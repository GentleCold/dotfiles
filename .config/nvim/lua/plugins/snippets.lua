return {
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
    -- config = function()
    --   -- friendly-snippets - enable standardized comments snippets
    --   require("luasnip").filetype_extend("typescript", { "tsdoc" })
    --   require("luasnip").filetype_extend("javascript", { "jsdoc" })
    --   require("luasnip").filetype_extend("lua", { "luadoc" })
    --   require("luasnip").filetype_extend("python", { "pydoc" })
    --   require("luasnip").filetype_extend("rust", { "rustdoc" })
    --   require("luasnip").filetype_extend("cs", { "csharpdoc" })
    --   require("luasnip").filetype_extend("java", { "javadoc" })
    --
    --   require("luasnip").filetype_extend("c", { "cdoc" })
    --   require("luasnip").filetype_extend("cpp", { "cppdoc" })
    --
    --   require("luasnip").filetype_extend("h", { "cdoc" })
    --   require("luasnip").filetype_extend("hpp", { "cppdoc" })
    --
    --   require("luasnip").filetype_extend("h", { "c" })
    --   require("luasnip").filetype_extend("hpp", { "cpp" })
    --
    --   require("luasnip").filetype_extend("php", { "phpdoc" })
    --   require("luasnip").filetype_extend("kotlin", { "kdoc" })
    --   require("luasnip").filetype_extend("ruby", { "rdoc" })
    --   require("luasnip").filetype_extend("sh", { "shelldoc" })
    -- end
  }
}
