return {
  'Bekaboo/dropbar.nvim',
  opts = {
    icons = {
      ui = { bar = { separator = ' ' .. '>' } },
      kinds = {
        symbols = {
          Array = ' 󰅪 ',
          BlockMappingPair = ' 󰅩 ',
          Boolean = '  ',
          BreakStatement = ' 󰙧 ',
          Call = ' 󰃷 ',
          CaseStatement = ' 󰨚 ',
          Class = '  ',
          Color = '  ',
          Constant = '  ',
          Constructor = ' 󰆧 ',
          ContinueStatement = '  ',
          Copilot = '  ',
          Declaration = ' 󰙠 ',
          Delete = ' 󰩺 ',
          DoStatement = ' 󰑖 ',
          Element = ' 󰅩 ',
          Enum = '  ',
          EnumMember = '  ',
          Event = '  ',
          Field = '  ',
          File = '  ',
          Folder = '  ',
          ForStatement = '󰑖 ',
          Function = ' 󰆧 ',
          GotoStatement = ' 󰁔 ',
          Identifier = ' 󰀫 ',
          IfStatement = ' 󰇉 ',
          Interface = '  ',
          Keyword = '  ',
          List = ' 󰅪 ',
          Log = ' 󰦪 ',
          Lsp = '  ',
          Macro = ' 󰁌 ',
          MarkdownH1 = ' 󰉫 ',
          MarkdownH2 = ' 󰉬 ',
          MarkdownH3 = ' 󰉭 ',
          MarkdownH4 = ' 󰉮 ',
          MarkdownH5 = ' 󰉯 ',
          MarkdownH6 = ' 󰉰 ',
          Method = ' 󰆧 ',
          Module = ' 󰅩 ',
          Namespace = ' 󰅩 ',
          Null = ' 󰢤 ',
          Number = ' 󰎠 ',
          Object = ' 󰅩 ',
          Operator = '  ',
          Package = ' 󰆧 ',
          Pair = ' 󰅪 ',
          Property = '  ',
          Reference = '  ',
          Regex = '  ',
          Repeat = ' 󰑖 ',
          Return = ' 󰌑 ',
          RuleSet = ' 󰅩 ',
          Scope = ' 󰅩 ',
          Section = ' 󰅩 ',
          Snippet = '  ',
          Specifier = ' 󰦪 ',
          Statement = ' 󰅩 ',
          String = '  ',
          Struct = '  ',
          SwitchStatement = ' 󰨙 ',
          Table = ' 󰅩 ',
          Terminal = '  ',
          Text = ' 󰀬 ',
          Type = '  ',
          TypeParameter = '  ',
          Unit = '  ',
          Value = '  ',
          Variable = '  ',
          WhileStatement = ' 󰑖 ',
        },
      },
    },
    bar = {
      enable = function(buf, win, _)
        if
          not vim.api.nvim_buf_is_valid(buf)
          or not vim.api.nvim_win_is_valid(win)
          or vim.fn.win_gettype(win) ~= ''
          or vim.wo[win].winbar ~= ''
          or vim.bo[buf].ft == 'help'
        then
          return false
        end

        local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buf))
        if stat and stat.size > 1024 * 1024 then
          return false
        end

        return vim.bo[buf].ft == 'markdown'
          or vim.bo[buf].ft == 'text'
          or vim.bo[buf].bt == ''
          or pcall(vim.treesitter.get_parser, buf)
          or not vim.tbl_isempty(vim.lsp.get_clients {
            bufnr = buf,
            method = 'textDocument/documentSymbol',
          })
      end,
      update_debounce = 100,
      sources = function(buf, _)
        local sources = require 'dropbar.sources'
        local utils = require 'dropbar.utils'

        if vim.bo[buf].ft == 'markdown' then
          return { sources.markdown }
        end
        if vim.bo[buf].buftype == 'terminal' then
          return { sources.terminal }
        end
        return {
          utils.source.fallback {
            sources.lsp,
            sources.treesitter,
          },
        }
      end,
    },
  },
}

-- return {
--   'Bekaboo/dropbar.nvim',
--   dependencies = {
--     'nvim-telescope/telescope-fzf-native.nvim',
--     build = 'make',
--   },
--   event = {
--     'VeryLazy',
--     -- 'BufReadPost',
--     -- 'BufNewFile'
--   },
--   -- enabled = false,
--   config = function()
--     local dropbar_api = require 'dropbar.api'
--     vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
--     -- vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
--     -- vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
--   end,
-- }
