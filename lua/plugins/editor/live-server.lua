-- return {
--   {
--     -- Updated to the new Forgejo URL before the GitHub shutdown
--     "https://barrettruth.com",
--     cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
--     ft = { "html", "css", "javascript", "javascriptreact", "typescriptreact" },
--     init = function()
--       vim.g.live_server = {
--         port = 5050,
--         browser = true,
--         css_inject = true,
--       }
--     end,
--     config = function()
--       -- Safely binds the keymaps only inside the specified file types
--       vim.api.nvim_create_autocmd("FileType", {
--         pattern = { "html", "css", "javascript", "javascriptreact", "typescriptreact" },
--         callback = function(args)
--           vim.keymap.set(
--             "n",
--             "<leader>cL",
--             "<cmd>LiveServerStart<cr>",
--             { buffer = args.buf, desc = "Start Live Server" }
--           )
--           vim.keymap.set("n", "<leader>cl", "<cmd>LiveServerStop<cr>", { buffer = args.buf, desc = "Stop Live Server" })
--         end,
--       })
--     end,
--   },
-- }

return {
  {
    "https://forge.barrettruth.com/barrettruth/live-server.nvim",
    cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
    ft = { "html", "css", "javascript", "javascriptreact", "typescriptreact" },
    keys = {
      { "<leader>cL", "<cmd>LiveServerStart<cr>", desc = "Start Live Server", ft = "html" },
      { "<leader>cl", "<cmd>LiveServerStop<cr>", desc = "Stop Live Server", ft = "html" },
    },
    init = function()
      vim.g.live_server = {
        port = 5050,
        browser = true,
        css_inject = true,
      }
    end,
  },
}
