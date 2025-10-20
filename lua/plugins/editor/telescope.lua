return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false, -- load immediately (important for dashboard, Noice, etc.)
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = " ",
          path_display = { "smart" },
          file_ignore_patterns = { "node_modules", ".git/" },
        },
      })
    end,
  },
}

