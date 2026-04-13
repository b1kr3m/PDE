return {
  {
    "barrett-ruth/live-server.nvim",
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
