return {
  -- Treesitter for HTML syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "json",
      })
    end,
  },

  -- Auto-close HTML tags
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    },
  },

  -- LSP Configuration for Web Development
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- HTML
        html = {
          filetypes = { "html", "htmldjango", "blade" },
        },
        
        -- CSS
        cssls = {
          filetypes = { "css", "scss", "less" },
        },
        
        -- Emmet
        emmet_ls = {
          filetypes = {
            "html",
            "htmldjango",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
          },
        },
        
        -- TypeScript/JavaScript
        ts_ls = {},
      },
    },
  },

  -- Mason: Ensure web dev tools are installed
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSPs
        "html-lsp",
        "css-lsp",
        "emmet-ls",
        "typescript-language-server",
        
        -- Formatters
        "prettierd",
        "prettier",
        
        -- Linters
        "eslint_d",
        "htmlhint",
        "stylelint",
      },
    },
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        html = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        scss = { "prettierd", "prettier" },
        javascript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
      },
    },
  },

  -- Linting
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        html = { "htmlhint" },
        css = { "stylelint" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
      },
    },
  },
}
