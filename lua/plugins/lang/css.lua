return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "css", "scss" })
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {
          filetypes = { "css", "scss", "less" },
        },
        emmet_ls = {
          filetypes = { "css", "scss" },
        },
        tailwindcss = {
          filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact" },
        },
      },
    },
  },

  -- Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "css-lsp",
        "tailwindcss-language-server",
        "prettierd",
        "prettier",
        "stylelint",
      },
    },
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        css = { "prettierd", "prettier" },
        scss = { "prettierd", "prettier" },
      },
    },
  },
}
