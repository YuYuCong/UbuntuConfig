return {
  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        symbols = { -- Configure symbols mode
          win = {
            type = "split", -- split window
            relative = "win", -- relative to current window
            position = "right", -- right side
            size = 0.25, -- 25% of the window
          },
        },
      },
    },
  },
}
