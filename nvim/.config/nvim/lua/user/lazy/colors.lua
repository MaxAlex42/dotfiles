return {
  -- Load the theme
  {
    "polirritmico/monokai-nightasty.nvim",
    lazy = false,              -- Load the theme immediately on startup
    priority = 1000,           -- High priority to load before other plugins
    keys = {
      -- Key mapping to toggle between dark and light modes
        vim.keymap.set("n",  "<leader>tt", "<Cmd>MonokaiToggleLight<CR>"),
    },
    opts = {
      dark_style_background = "transparent", -- You can also set this to "default" or "dark"
      light_style_background = "default",    -- Set a light style background
      markdown_header_marks = true,          -- Enable markdown header marks
      color_headers = true,                  -- Enable header colors for h1, h2, etc.
      lualine_bold = true,                   -- Bold Lualine sections
      lualine_style = "default",             -- Follow the dark/light theme for Lualine
      terminal_colors = function(colors)
        return { fg = colors.fg_dark }       -- Customize terminal colors
      end,
      on_colors = function(colors)
        -- Customize specific colors
        local is_light = vim.o.background == "light"
        colors.comment = is_light and "#2d7e79" or colors.grey
      end,
      on_highlights = function(highlights, colors)
        -- Customize highlights for specific groups
        highlights.TelescopeSelection = { bold = true }
        highlights.TelescopeBorder = { fg = colors.grey }
      end,
    },
    config = function(_, opts)
      -- Enable cursorline
      vim.opt.cursorline = true
      -- Set default background theme to dark
      vim.o.background = "dark"
      -- Load the theme
      require("monokai-nightasty").load(opts)
    end,
  },
}
