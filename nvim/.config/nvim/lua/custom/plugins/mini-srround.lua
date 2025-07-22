-- TODO: add mini related plugins to `/nvim/lua/kickstart/plugins/mini.lua`

return {
  'echasnovski/mini.surround',
  version = false,
  config = function()
    require('mini.surround').setup {
      -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
      highlight_duration = 500,

      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        add = '<C-s>a', -- Add surrounding in Normal and Visual modes
        delete = '<C-s>d', -- Delete surrounding
        find = '<C-s>f', -- Find surrounding (to the right)
        find_left = '<C-s>F', -- Find surrounding (to the left)
        highlight = '<C-s>h', -- Highlight surrounding
        replace = '<C-s>r', -- Replace surrounding
        update_n_lines = '<C-s>n', -- Update `n_lines`

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },

      -- Number of lines within which surrounding is searched
      n_lines = 20,

      -- Whether to respect selection type:
      -- - Place surroundings on separate lines in linewise mode.
      -- - Place surroundings on each line in blockwise mode.
      respect_selection_type = false,

      -- How to search for surrounding (first inside current line, then inside
      -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
      -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
      -- see `:h MiniSurround.config`.
      search_method = 'cover',

      -- Whether to disable showing non-error feedback
      -- This also affects (purely informational) helper messages shown after
      -- idle time if user input is required.
      silent = false,
    }
  end,
}
