return {
  {
    "barrett-ruth/live-server.nvim",
    build = "npm install -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
    config = function()
      require("live-server").setup({
        -- Arguments passed to live-server
        args = {
          "--port=5050",        -- Port number
          "--browser=firefox",  -- Change to your browser: firefox, google-chrome, brave
          "--no-css-inject",    -- Disable CSS injection (full reload)
        },
      })
    end,
  },
}
