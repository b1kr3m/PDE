-- ~/.config/nvim/lua/plugins/copilot.lua

return {
  {
    "zbirenbaum/copilot.lua",
    opts = function(_, opts)
      -- Enable Copilot for multiple languages
      opts.lang_server = {
        "rust-analyzer",
        "tsserver",
        "omni-nim",
        "clangd",
        "pyright",
      }

      -- Add any custom configurations here
      opts.auto_start = true
      -- ... other options ...
    end,
  },
}
