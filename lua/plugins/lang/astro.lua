local function find_typescript_sdk(root_dir)
  local candidates = {}

  if root_dir then
    candidates[#candidates + 1] = vim.fs.joinpath(root_dir, "node_modules/typescript/lib")
  end

  candidates[#candidates + 1] = vim.fs.joinpath(
    vim.fn.stdpath("data"),
    "mason/packages/typescript-language-server/node_modules/typescript/lib"
  )

  for _, path in ipairs(candidates) do
    if vim.fn.filereadable(vim.fs.joinpath(path, "tsserverlibrary.js")) == 1
      or vim.fn.filereadable(vim.fs.joinpath(path, "typescript.js")) == 1 then
      return path
    end
  end

  return candidates[#candidates]
end

return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "astro" })
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        astro = {
          -- Astro's current language server requires a TS SDK with tsserverlibrary.js.
          init_options = {
            typescript = {},
          },
          before_init = function(_, config)
            config.init_options = config.init_options or {}
            config.init_options.typescript = config.init_options.typescript or {}
            config.init_options.typescript.tsdk = find_typescript_sdk(config.root_dir)
          end,
        },
      },
      setup = {
        -- mason-lspconfig selects TypeScript 7 for Astro, which Astro LSP cannot load yet.
        astro = function(_, opts)
          vim.lsp.config("astro", opts)
          vim.lsp.enable("astro")
          return true
        end,
      },
    },
  },

  -- Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "astro-language-server",
        "typescript-language-server",
        "prettierd",
        "prettier",
      },
    },
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        prettier = {
          args = { "--plugin=prettier-plugin-astro", "--parser=astro", "--stdin-filepath", "$FILENAME" },
        },
      },
      formatters_by_ft = {
        astro = { "prettier" },
      },
    },
  },
}
