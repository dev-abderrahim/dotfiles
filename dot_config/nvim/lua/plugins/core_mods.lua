return {
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      opts.colorscheme = function()
        vim.schedule(function()
          if vim.g.COLORSCHEME then
            vim.cmd.colorscheme(vim.g.COLORSCHEME)
          else
            require("tokyonight").load()
          end
        end)
      end
    end,
  },

  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          colorschemes = {
            confirm = function(p, i)
              local orig_confirm = require("snacks.picker.config.sources").colorschemes.confirm
              vim.g.COLORSCHEME = i.text
              orig_confirm(p, i)
            end,
          },
        },
      },
    },
  },
}
