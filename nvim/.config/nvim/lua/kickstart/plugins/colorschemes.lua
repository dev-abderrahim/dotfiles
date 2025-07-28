return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.

    'folke/tokyonight.nvim',
    lazy = false,
    -- enabled = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = true }, -- Disable italics in comments
        },
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-night', 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
  {
    'marko-cerovac/material.nvim',
    -- enabled = false,
    priority = 1000,
    lazy = false,
    opts = {},
    config = function()
      require('material').setup {
        styles = { -- Give comments style such as bold, italic, underline etc.
          comments = {
            italic = true,
          },
          strings = {
            bold = true,
          },
          keywords = {
            --[[ underline = true ]]
          },
          functions = {
            --[[ bold = true, undercurl = true ]]
          },
          variables = {},
          operators = {},
          types = {},
        },
      }

      -- vim.cmd.colorscheme 'material-deep-ocean'
      -- vim.g.material_style = 'lighter'
    end,
  },
  {
    'Mofiqul/vscode.nvim',
    -- enabled = false,
    priority = 1000,
    lazy = false,
    config = function()
      require('vscode').setup {
        -- vim.cmd.colorscheme 'vscode',

        -- Enable italic comment
        italic_comments = true,

        -- Underline `@markup.link.*` variants
        underline_links = true,
      }
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    -- enabled = false,
    priority = 1000,
    config = function()
      -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
      -- vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
  {
    'scottmckendry/cyberdream.nvim',
    -- enabled = false,
    priority = 1000,
    lazy = false,
    config = function()
      -- require('cyberdream').setup {
      --   -- Enable italics comments
      --   italic_comments = true,
      -- }
      -- vim.cmd.colorscheme 'cyberdream'
    end,
  },
  {
    'f4z3r/gruvbox-material.nvim',
    name = 'gruvbox-material',
    -- enabled = false,
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'AlphaTechnolog/pywal.nvim',
    lazy = false,
    priority = 1000,
    config = true,
  },
  {
    'xero/miasma.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd 'colorscheme miasma'
    end,
  },
  {
    'tanvirtin/monokai.nvim',
    lazy = false,
    priority = 1000,
    config = true,
  },
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup {
        options = {
          dim_inactive = true, -- Non focused panes set to alternative background
          styles = {
            comments = 'italic',
            keywords = 'bold',
            types = 'italic,bold',
          },
          darken = { -- Darken floating windows and sidebar-like windows
            floats = true,
            sidebars = {
              enable = false,
            },
          },
        },
      }

      -- vim.cmd 'colorscheme github_dark'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
