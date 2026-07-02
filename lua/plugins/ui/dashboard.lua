return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    dashboard = {
      enabled = true,
      width = 80,
      row = nil,
      col = nil,
      pane_gap = 4,
      preset = {
      header = [[
          ___.   ____ __          ________          
          \_ |__/_   |  | ________\_____  \  _____  
          | __ \|   |  |/ /\_  __ \_(__  < /     \ 
          | \_\ \   |    <  |  | \/       \  Y Y  \
          |___  /___|__|_ \ |__| /______  /__|_|  /
              \/         \/             \/      \/ 
          ]],

        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
          { icon = " ", key = "c", desc = "Config", action = ":edit $MYVIMRC" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      formats = {
        icon = function(item)
          if item.icon then
            return { item.icon, width = 2, hl = "icon" }
          end
          return item.icon
        end,
        footer = { "%s", align = "center" },
        header = { "%s", align = "center" },
      },
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        {
          icon = "",
          title = "Projects",
          section = "projects",
          indent = 2,
          padding = 1,
        },
        { section = "startup" },
      },
    },
    -- Configure project management
    projects = {
      enabled = true,
      -- Define your custom projects
      projects = {
        {
          name = "Scripts",
          path = "/opt/scripts",
          icon = "♣",
        },
        {
          name = "Bug Bounty Scripts",
          path = "/opt/",
          icon = "♂ ",
        },
        {
          name = "Hyprland Config",
          path = "~/.config/hypr",
          icon = "✿ ",
        },
        {
          name = "",
          path = "~/dev/development/",
          icon = "♪ ",
        },
      },
    },
  },
}

--
--
-- return {
--   {
--     "folke/snacks.nvim",
--     lazy = false,  -- Force the plugin to load on startup (not lazy-loaded)
--     opts = {
--       dashboard = {
--         enabled = true,  -- Ensure the dashboard is enabled
--         width = 80,  -- Set the width of the dashboard
--         row = nil, -- Position the dashboard in the center (nil means default)
--         col = nil, -- Position the dashboard in the center (nil means default)
--         pane_gap = 4, -- Space between vertical panes
--         preset = {
--           header = [[
--           ___.   ____ __          ________          
--           \_ |__/_   |  | ________\_____  \  _____  
--           | __ \|   |  |/ /\_  __ \_(__  < /     \ 
--           | \_\ \   |    <  |  | \/       \  Y Y  \
--           |___  /___|__|_ \ |__| /______  /__|_|  /
--               \/         \/             \/      \/ 
--           ]],
--           keys = {
--             { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
--             { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
--             { icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
--             { icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
--             { icon = " ", key = "c", desc = "Config", action = ":edit $MYVIMRC" },
--             { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
--             { icon = " ", key = "q", desc = "Quit", action = ":qa" },
--           },
--         },
--         formats = {
--           icon = function(item)
--             if item.icon then
--               return { item.icon, width = 2, hl = "icon" }
--             end
--             return item.icon
--           end,
--           footer = { "%s", align = "center" },
--           header = { "%s", align = "center" },
--         },
--         sections = {
--           { section = "header" },
--           { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
--           { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
--           { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
--           { section = "startup" },
--         },
--       },
--     },
--   },
-- }
--
--

-- return {
--   {
--     "folke/snacks.nvim",
--     lazy = false,  -- Force the plugin to load on startup (not lazy-loaded)
--     opts = {
--       dashboard = {
--         enabled = true,  -- Ensure the dashboard is enabled
--         width = 80,  -- Set the width of the dashboard
--         row = nil, -- Position the dashboard in the center (nil means default)
--         col = nil, -- Position the dashboard in the center (nil means default)
--         pane_gap = 4, -- Space between vertical panes
--         preset = {
--           header = [[
--         ██╗      █████╗ ██╗     ██╗████████╗███████╗ ██╗ ██████╗  ██████╗██╗  ██╗
--         ██║     ██╔══██╗██║     ██║╚══██╔══╝╚════██║███║██╔═████╗██╔════╝╚██╗██╔╝
--         ██║     ███████║██║     ██║   ██║█████╗ ██╔╝╚██║██║██╔██║██║      ╚███╔╝ 
--         ██║     ██╔══██║██║     ██║   ██║╚════╝██╔╝  ██║████╔╝██║██║      ██╔██╗ 
--         ███████╗██║  ██║███████╗██║   ██║      ██║   ██║╚██████╔╝╚██████╗██╔╝ ██╗
--         ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝   ╚═╝      ╚═╝   ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝
--           ]],
--           keys = {
--             { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
--             { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
--             { icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
--             { icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
--             { icon = " ", key = "c", desc = "Config", action = ":edit $MYVIMRC" },
--             { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
--             { icon = " ", key = "q", desc = "Quit", action = ":qa" },
--           },
--         },
--         formats = {
--           icon = function(item)
--             if item.icon then
--               return { item.icon, width = 2, hl = "icon" }
--             end
--             return item.icon
--           end,
--           footer = { "%s", align = "center" },
--           header = { "%s", align = "center" },
--         },
--         section = {
--           { section = "header" },
--           { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
--           { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
--           { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
--           { section = "startup" },
--         },
--       },
--     },
--   },
-- }

--
-- return {
--   {
--     "folke/snacks.nvim",
--     lazy = false,  -- Force the plugin to load on startup (not lazy-loaded)
--     opts = {
--       dashboard = {
--         enabled = true,  -- Ensure the dashboard is enabled
--         width = 80,  -- Set the width of the dashboard
--         row = nil, -- Position the dashboard in the center (nil means default)
--         col = nil, -- Position the dashboard in the center (nil means default)
--         pane_gap = 4, -- Space between vertical panes
--         preset = {
--           header = [[
--         ██╗      █████╗ ██╗     ██╗████████╗███████╗ ██╗ ██████╗  ██████╗██╗  ██╗
--         ██║     ██╔══██╗██║     ██║╚══██╔══╝╚════██║███║██╔═████╗██╔════╝╚██╗██╔╝
--         ██║     ███████║██║     ██║   ██║█████╗ ██╔╝╚██║██║██╔██║██║      ╚███╔╝ 
--         ██║     ██╔══██║██║     ██║   ██║╚════╝██╔╝  ██║████╔╝██║██║      ██╔██╗ 
--         ███████╗██║  ██║███████╗██║   ██║      ██║   ██║╚██████╔╝╚██████╗██╔╝ ██╗
--         ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝   ╚═╝      ╚═╝   ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝
--           ]],
--           keys = {
--             { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
--             { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
--             { icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
--             { icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
--             { icon = " ", key = "c", desc = "Config", action = ":edit $MYVIMRC" },
--             { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
--             { icon = " ", key = "q", desc = "Quit", action = ":qa" },
--           },
--         },
--         formats = {
--           icon = function(item)
--             if item.icon then
--               return { item.icon, width = 2, hl = "icon" }
--             end
--             return item.icon
--           end,
--           footer = { "%s", align = "center" },
--           header = { "%s", align = "center" },
--         },
--         sections = {
--           { section = "header" },
--           {
--             pane = 2,
--             section = "terminal",
--             -- cmd = "colorscript -e square",
--             cmd = "colorscript -e space-invaders",
--             -- cmd = "colorscript -e fade",
--             height = 5,
--             padding = 1,
--           },
--           { section = "keys", gap = 1, padding = 1 },
--           { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
--           { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
--           {
--             pane = 2,
--             icon = " ",
--             title = "Git Status",
--             section = "terminal",
--             enabled = function()
--               return Snacks.git.get_root() ~= nil
--             end,
--             cmd = "git status --short --branch --renames",
--             height = 5,
--             padding = 1,
--             ttl = 5 * 60,
--             indent = 3,
--           },
--           { section = "startup" },
--         },
--       },
--     },
--   },
-- }
--
