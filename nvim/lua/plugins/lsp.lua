local enable = true
if not enable then
  return {}
end

return {

  -- LazyVim includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim.
  { import = "lazyvim.plugins.extras.lang.clangd" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "c",
        "cpp",
        "cmake",
      })
    end,
  },

  -- lsp format只format修改的部分
  {
    "joechrisellis/lsp-format-modifications.nvim",
  },
  -- lsp配置
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- 添加.c.h文件快速切换快捷键
      opts.servers.clangd.keys = {
        { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
      }

      -- 关闭自动format
      vim.g.autoformat = false
      -- 临时切换自动format的启用与否
      -- <leader>uf
      -- format当前文件
      -- <leader>cf

      ------------------------------- 添加局部format，相应更改在lspconfig/configs.lua里面
      -- -- 局部format功能的方法
      -- local lsp_format_modifications = function(client, bufnr)
      --   require("lsp-format-modifications").format_modifications(client, bufnr)
      -- end
      -- -- 替换on_save时的局部format功能的方法
      -- local lsp_format_modifications_on_save = function(client, bufnr)
      --   local augroup_id = vim.api.nvim_create_augroup("FormatModificationsDocumentFormattingGroup", { clear = false })
      --   vim.api.nvim_clear_autocmds({ group = augroup_id, buffer = bufnr })
      --
      --   vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      --     group = augroup_id,
      --     buffer = bufnr,
      --     callback = function()
      --       require("lsp-format-modifications").format_modifications(client, bufnr)
      --     end,
      --   })
      -- end
      -- -- 添加局部format命令
      -- vim.api.nvim_buf_create_user_command(
      --   opts.bufnr,
      --   "FormatModificationsCongYu",
      --   lsp_format_modifications(opts.client, opts.bufnr),
      --   {}
      -- )
      -- 添加局部foramt命令的快捷键
      local Keys = require("lazyvim.plugins.lsp.keymaps").get()
      vim.list_extend(Keys, {
        {
          "cf",
          "<cmd>FormatModificationsCongYu<cr>",
          desc = "FormatModificationsCongYu",
          remap = true,
        },
      })
    end,
  },

  -- -- 大工程需要lsp进度条
  -- {
  --   "linrongbin16/lsp-progress.nvim",
  --   event = "VeryLazy",
  --   opts = {},
  -- },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   opts = {
  --     sections = {
  --       lualine_x = {
  --         function()
  --           return require("lsp-progress").progress()
  --         end,
  --         "filesize",
  --         "filetype",
  --       },
  --     },
  --   },
  -- },
  -- 代码补全cmp的配置
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = function(_, opts)
  --     local cmp = require("hrsh7th/nvim-cmp")
  --     opts.mapping = cmp.mapping.preset.insert({
  --       ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --       ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --       ["<C-Space>"] = cmp.mapping.complete(),
  --       ["<C-e>"] = cmp.mapping.abort(),
  --       ["<CR>"] = cmp.mapping.confirm({ select = true }),
  --     })
  --   end,
  -- },
}
