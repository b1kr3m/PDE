-- Save this file as: ~/.config/nvim/lua/plugins/auto-save.lua

return {
  "okuuva/auto-save.nvim",
  version = "^1.0.0",
  event = { "InsertLeave", "TextChanged" },
  keys = {
    { "<leader>as", "<cmd>ASToggle<CR>", desc = "Toggle Auto-Save" },
  },
  opts = {
    enabled = true, -- Start enabled by default

    -- Trigger events
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
      defer_save = { "InsertLeave", "TextChanged" },
      cancel_deferred_save = { "InsertEnter" },
    },

    -- Condition function to exclude certain files
    condition = function(buf)
      local fn = vim.fn
      local filetype = fn.getbufvar(buf, "&filetype")
      local buftype = fn.getbufvar(buf, "&buftype")
      local filename = fn.expand("%:t")
      
      -- Excluded filetypes (useful for special buffers)
      local excluded_filetypes = {
        "gitcommit",
        "gitrebase",
        "NvimTree",
        "neo-tree",
        "Outline",
        "TelescopePrompt",
        "alpha",
        "dashboard",
        "lazygit",
        "oil",
        "prompt",
        "toggleterm",
        "mason",
        "lazy",
        "help",
        "qf", -- quickfix
      }
      
      -- Excluded filenames
      local excluded_filenames = {
        ".env",
        ".env.local",
      }
      
      -- Don't save special buffers
      if buftype ~= "" then
        return false
      end
      
      -- Don't save excluded filetypes
      if vim.tbl_contains(excluded_filetypes, filetype) then
        return false
      end

      -- Don't save excluded filenames
      if vim.tbl_contains(excluded_filenames, filename) then
        return false
      end

      return true
    end,

    write_all_buffers = false,
    noautocmd = false,
    lockmarks = false,
    debounce_delay = 1000, -- Wait 1 second before saving
    debug = false,
  },
  
  config = function(_, opts)
    local autosave = require("auto-save")
    autosave.setup(opts)
    
    -- Create autocommands for notifications
    local group = vim.api.nvim_create_augroup("autosave_notify", { clear = true })
    
    -- Notification when file is saved
    vim.api.nvim_create_autocmd("User", {
      pattern = "AutoSaveWritePost",
      group = group,
      callback = function(args)
        if args.data.saved_buffer ~= nil then
          local filename = vim.fn.fnamemodify(
            vim.api.nvim_buf_get_name(args.data.saved_buffer),
            ":t"
          )
          -- Minimal notification (you can customize this)
          vim.notify("Saved: " .. filename, vim.log.levels.INFO, {
            title = "Auto-Save",
            timeout = 1000,
          })
        end
      end,
    })
    
    -- Notification when enabling
    vim.api.nvim_create_autocmd("User", {
      pattern = "AutoSaveEnable",
      group = group,
      callback = function()
        vim.notify("Auto-Save Enabled ✓", vim.log.levels.INFO, {
          title = "Auto-Save",
        })
      end,
    })
    
    -- Notification when disabling
    vim.api.nvim_create_autocmd("User", {
      pattern = "AutoSaveDisable",
      group = group,
      callback = function()
        vim.notify("Auto-Save Disabled ✗", vim.log.levels.WARN, {
          title = "Auto-Save",
        })
      end,
    })
  end,
}
