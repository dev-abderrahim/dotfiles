return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
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

      vim.cmd.colorscheme 'material-deep-ocean'
      -- vim.g.material_style = 'lighter'
    end,
  },
  {
    'Mofiqul/vscode.nvim',
    -- enabled = false,
    priority = 1000,
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
    config = function()
      require('cyberdream').setup {
        -- Enable italics comments
        italic_comments = true,
      }
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
}
-- vim: ts=2 sts=2 sw=2 et
