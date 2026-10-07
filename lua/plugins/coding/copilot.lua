return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      -- Keep this enabled for the inline grey ghost text
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = { accept = false }, -- Set to false here, we handle it in blink below
      },
      panel = { enabled = false },
    },
  },
  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = { "fang2hou/blink-copilot" },
    opts = function(_, opts)
      -- 1. Set up your existing providers
      opts.sources = opts.sources or {}
      opts.sources.default = opts.sources.default or { "lsp", "path", "snippets", "buffer" }
      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers.copilot = {
        name = "copilot",
        module = "blink-copilot",
        score_offset = 100,
      }
      table.insert(opts.sources.default, "copilot")

      -- 2. Intercept the <Tab> key to accept inline Copilot suggestions
      opts.keymap = opts.keymap or {}
      opts.keymap["<Tab>"] = {
        function(cmp)
          -- If inline copilot ghost text is visible, accept it and hide the blink menu
          if require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").accept()
            return cmp.hide()
          -- Otherwise, fall back to standard blink behavior (like snippets or indenting)
          elseif cmp.is_in_snippet() then
            return cmp.accept()
          end
        end,
        "snippet_forward",
        "fallback",
        -- rigging,
      }
    end,
  },
}
