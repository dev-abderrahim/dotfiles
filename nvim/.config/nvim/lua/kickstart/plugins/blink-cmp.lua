return {
  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    -- version = '1.*',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        -- 'default' (recommended) for mappings similar to built-in completions
        --   <c-y> to accept ([y]es) the completion.
        --    This will auto-import if your LSP supports it.
        --    This will expand snippets if the LSP sent a snippet.
        -- 'super-tab' for tab to accept
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- For an understanding of why the 'default' preset is recommended,
        -- you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        --
        -- All presets have the following mappings:
        -- <tab>/<s-tab>: move to right/left of your snippet expansion
        -- <c-space>: Open menu or open docs if already open
        -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
        -- <c-e>: Hide menu
        -- <c-k>: Toggle signature help
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        preset = 'default',

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'normal',
      },

      completion = {
        -- By default, you may press `<c-space>` to show the documentation.
        -- Optionally, set `auto_show = true` to show the documentation after a delay.
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
          cycle = {
            from_bottom = true,
            from_top = true,
          },
        },
      },

      -- sources = {
      --   default = { 'lsp', 'path', 'snippets', 'lazydev' },
      --   providers = {
      --     lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      --   },
      -- },

      sources = {
        -- Stolen from https://github.com/saecki/dotfiles/blob/d384c5ba4b023253669a121c27a9749ab4a0b916/.config/nvim/lua/config/blink.lua#L30-L53
        --                 -- transform_items = function(ctx, items)
        --                                 --   local line = ctx.cursor[1] - 1
        --                                                 --   local col = ctx.cursor[2]
        --
        --   for _, item in ipairs(items) do
        --     if item.textEdit then
        --       if item.textEdit.range then
        --         -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#textEdit
        --         -- trim edit range after cursor
        --         local range_end = item.textEdit.range["end"]
        --         if range_end.line == line and range_end.character > col then
        --           range_end.character = col
        --         end
        --       elseif item.textEdit.insert then
        --         -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#insertReplaceEdit
        --         -- always use insert range
        --         item.textEdit.range = item.textEdit.insert
        --         item.textEdit.replace = nil
        --       end
        --     end
        --   end
        --
        --   return items
        -- end,
        --
        min_keyword_length = 0,

        default = function()
          local success, node = pcall(vim.treesitter.get_node)
          local providers_inside_comments = function(s, n)
            if s and n and vim.tbl_contains({ 'comment', 'line_comment', 'block_comment', 'comment_content' }, n:type()) then
              return { 'path', 'buffer' }
            end
            return {}
          end
          if vim.bo.filetype == '' or vim.bo.filetype == 'text' then
            return { 'buffer', 'path' }
          elseif vim.bo.filetype == 'lua' then
            return { 'lsp', 'path', 'lazydev', 'snippets', 'buffer' }
          elseif vim.bo.filetype == 'toml' then
            return { 'lsp', 'buffer' }
          end
          return vim.list_extend({ 'lsp', 'path', 'snippets', 'buffer' }, providers_inside_comments(success, node))
        end,
        -- term = {
        --   "buffer",
        --   "path",
        -- },

        per_filetype = {},
        providers = {
          lsp = {
            async = true,
            name = 'Lsp',
            module = 'blink.cmp.sources.lsp',
            enabled = true,
            score_offset = 0,
            fallbacks = {},
            override = {},
          },
          path = {
            name = 'path',
            module = 'blink.cmp.sources.path',
            enabled = true,
            score_offset = 5,
            opts = {
              trailing_slash = true,
              label_trailing_slash = true,
              get_cwd = function(ctx)
                return vim.fn.expand(('#%d:p:h').format(ctx.bufnr))
              end,
              -- show_show_hidden_files_by_default = true,
            },
            should_show_items = true,
            fallbacks = { 'lazydev' },
          },
          snippets = {
            name = 'Snippets',
            enabled = true,
            module = 'blink.cmp.sources.snippets',
            score_offset = 0,
            -- preset = "luasnip",
            -- For `snippets.preset == 'luasnip'`
            opts = {
              -- Whether to use show_condition for filtering snippets
              use_show_condition = true,
              -- Whether to show autosnippets in the completion list
              show_autosnippets = true,
            },
          },
          buffer = {
            name = 'buffer',
            module = 'blink.cmp.sources.buffer',
            score_offset = -20,
            opts = {
              get_bufnrs = function()
                return vim.tbl_filter(function(bufnr)
                  return vim.bo[bufnr].buftype == ''
                end, vim.api.nvim_list_bufs())
              end,
            },
          },
          lazydev = {
            name = 'lazydev',
            module = 'lazydev.integrations.blink',
            fallbacks = { 'lsp' },
          },
        },
      },

      snippets = { preset = 'luasnip' },

      -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
      -- which automatically downloads a prebuilt binary when enabled.
      --
      -- By default, we use the Lua implementation instead, but you may enable
      -- the rust implementation via `'prefer_rust_with_warning'`
      --
      -- See :h blink-cmp-config-fuzzy for more information
      fuzzy = { implementation = 'lua' },

      -- Shows a signature help window while you type arguments for a function
      signature = { enabled = true },

      accept = {
        create_undo_point = true,
        auto_brackets = {
          enabled = vim.bo.buftype ~= 'prompt',
          default_brackets = { '(', ')', '{', '}' },
          override_brackets_for_filetypes = {},
          kind_resolution = {
            enabled = true,
            blocked_filetypes = { '.txt' },
          },
          semantic_token_resolution = {
            enabled = true,
            blocked_filetypes = {},
            timeout_ms = 400,
          },
          blocked_filetypes = { '.txt' },
          force_allow_filetypes = {},
        },
      },

      menu = {
        enabled = true,
        min_width = 15,
        max_height = 30,
        border = 'single',
        winblend = 0,
        winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
        scrollbar = true,
        scrolloff = 2,
        direction_priority = { 's', 'n' },
        auto_show = true,
        draw = {
          align_to = 'cursor',
          padding = 1,
          gap = 1,
          treesitter = { 'lsp' },
          columns = {
            { 'kind_icon' },
            { 'label', 'label_description', gap = 1 },
            { 'kind', gap = 1 },
          },

          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local icon = ctx.kind_icon
                if ctx.item.source_name == 'LSP' then
                  local color_item = require('nvim-highlight-colors').format(ctx.item.documentation, { kind = ctx.kind })
                  if color_item and color_item.abbr ~= '' then
                    icon = color_item.abbr
                  end
                end
                return icon .. ctx.icon_gap
              end,
              highlight = function(ctx)
                -- default highlight group
                local highlight = ctx.kind_hl
                -- if LSP source, check for color derived from documentation
                if ctx.item.source_name == 'LSP' then
                  local color_item = require('nvim-highlight-colors').format(ctx.item.documentation, { kind = ctx.kind })
                  if color_item and color_item.abbr_hl_group then
                    highlight = color_item.abbr_hl_group
                  end
                end
                return highlight
              end,
            },
            kind = {
              ellipsis = false,
              width = { fill = true },
              text = function(ctx)
                return '<' .. ctx.kind .. '>'
              end,
              highlight = function(ctx)
                return ctx.kind_hl
              end,
            },
            label = {
              ellipsis = true,
              width = { fill = true, max = 50 },
              text = function(ctx)
                return ctx.label .. ctx.label_detail
              end,
              highlight = function(ctx)
                local highlights = {
                  {
                    0,
                    #ctx.label,
                    group = ctx.deprecated and 'BlinkCmpLabelDeprecated' or 'BlinkCmpLabel',
                  },
                }
                if ctx.label_detail then
                  table.insert(highlights, { #ctx.label, #ctx.label + #ctx.label_detail, group = 'BlinkCmpLabelDetail' })
                end
                for _, idx in ipairs(ctx.label_matched_indices) do
                  table.insert(highlights, { idx, idx + 1, group = 'BlinkCmpLabelMatch' })
                end
                return highlights
              end,
            },
            label_description = {
              ellipsis = true,
              width = { max = 30 },
              text = function(ctx)
                return ctx.label_description
              end,
              highlight = 'BlinkCmpLabelDescription',
            },
          },
        },
        order = {
          n = 'bottom_up',
          s = 'top_down',
        },
      },

      ghost_text = {
        enabled = true,
        show_with_selection = true,
        show_without_selection = true,
        show_with_menu = false,
        show_without_menu = true,
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
