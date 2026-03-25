return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>sc",
      function()
        require("telescope.builtin").find_files({
          prompt_title = "📚 Cheatsheets",
          cwd = vim.fn.expand("~/.config/nvim/cheatsheets"),
          attach_mappings = function(_, map)
            map("i", "<CR>", function(prompt_bufnr)
              local selection = require("telescope.actions.state").get_selected_entry()
              require("telescope.actions").close(prompt_bufnr)
              vim.cmd("vsplit " .. selection.path)
            end)
            return true
          end,
        })
      end,
      desc = "Search Cheatsheets",
    },
    -- =========Quick access to specific cheatsheets============
    -- {
    --   "<leader>scp",
    --   function()
    --     vim.cmd("vsplit ~/.config/nvim/cheatsheets/python/decorators.txt")
    --   end,
    --   desc = "Python Decorators",
    -- },
    -- {
    --   "<leader>scb",
    --   function()
    --     require("telescope.builtin").find_files({
    --       prompt_title = "🔐 Bug Bounty Cheatsheets",
    --       cwd = vim.fn.expand("~/.config/nvim/cheatsheets/security"),
    --     })
    --   end,
    --   desc = "Security Cheatsheets",
    -- },
  },
}
