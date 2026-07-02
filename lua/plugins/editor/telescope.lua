return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false, -- load immediately (important for dashboard, Noice, etc.)
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ahmedkhalf/project.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local project = require("project_nvim")

      project.setup({})

      telescope.setup({
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = " ",
          path_display = { "smart" },
          file_ignore_patterns = { "node_modules", ".git/" },
        },
      })

      telescope.load_extension("projects")
    end,
  },
}
