return {

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    vscode = true,
    lazy = true,
    opts = {
      style = "moon",

      -- 分割线颜色
      on_colors = function(colors)
        colors.border = "#EE7942"
      end,

      -- 无边框的telescope
      -- on_highlights = function(hl, c)
      --   local prompt = "#2d3149"
      --   hl.TelescopeNormal = {
      --     bg = c.bg_dark,
      --     fg = c.fg_dark,
      --   }
      --   hl.TelescopeBorder = {
      --     bg = c.bg_dark,
      --     fg = c.bg_dark,
      --   }
      --   hl.TelescopePromptNormal = {
      --     bg = prompt,
      --   }
      --   hl.TelescopePromptBorder = {
      --     bg = prompt,
      --     fg = prompt,
      --   }
      --   hl.TelescopePromptTitle = {
      --     bg = prompt,
      --     fg = prompt,
      --   }
      --   hl.TelescopePreviewTitle = {
      --     bg = c.bg_dark,
      --     fg = c.bg_dark,
      --   }
      --   hl.TelescopeResultsTitle = {
      --     bg = c.bg_dark,
      --     fg = c.bg_dark,
      --   }
      -- end,
    },
  },

  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      colorscheme = "tokyonight",
    },
  },
}
