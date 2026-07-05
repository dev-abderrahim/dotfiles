return {
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "romgrk/barbar.nvim",
    version = "^1.0.0",
    lazy = false,
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      animation = false,
      auto_hide = false,
      tabpages = true,
      clickable = true,
      focus_on_close = "left",
      sidebar_filetypes = {
        ["neo-tree"] = { event = "BufWipeout" },
        ["snacks_layout_box"] = { event = "BufWipeout" },
      },
      icons = {
        buffer_index = false,
        buffer_number = false,
        button = "",
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
          [vim.diagnostic.severity.WARN] = { enabled = true },
          [vim.diagnostic.severity.INFO] = { enabled = false },
          [vim.diagnostic.severity.HINT] = { enabled = true },
        },
        gitsigns = {
          added = { enabled = true, icon = "+" },
          changed = { enabled = true, icon = "~" },
          deleted = { enabled = true, icon = "-" },
        },
        filetype = {
          enabled = true,
          custom_colors = false,
        },
        separator = { left = "▎", right = "" },
        separator_at_end = false,
        modified = { button = "●" },
        pinned = { button = "", filename = true },
        preset = "default",
      },
    },
    keys = {
      { "<S-h>", "<Cmd>BufferPrevious<CR>", desc = "Prev Buffer" },
      { "<S-l>", "<Cmd>BufferNext<CR>", desc = "Next Buffer" },
      { "[b", "<Cmd>BufferPrevious<CR>", desc = "Prev Buffer" },
      { "]b", "<Cmd>BufferNext<CR>", desc = "Next Buffer" },
      { "[B", "<Cmd>BufferMovePrevious<CR>", desc = "Move buffer prev" },
      { "]B", "<Cmd>BufferMoveNext<CR>", desc = "Move buffer next" },
      { "<leader>bp", "<Cmd>BufferPin<CR>", desc = "Toggle Pin" },
      { "<leader>bP", "<Cmd>BufferCloseAllButPinned<CR>", desc = "Delete Non-Pinned Buffers" },
      { "<leader>br", "<Cmd>BufferCloseBuffersRight<CR>", desc = "Delete Buffers to the Right" },
      { "<leader>bl", "<Cmd>BufferCloseBuffersLeft<CR>", desc = "Delete Buffers to the Left" },
      { "<leader>bd", "<Cmd>BufferClose<CR>", desc = "Delete Buffer" },
      { "<leader>bD", "<Cmd>BufferClose!<CR>", desc = "Delete Buffer (force)" },
      { "<leader>bj", "<Cmd>BufferPick<CR>", desc = "Pick Buffer" },
      { "<Tab>", "<Cmd>BufferNext<CR>", desc = "Next Buffer" },
      { "<S-Tab>", "<Cmd>BufferPrevious<CR>", desc = "Prev Buffer" },
    },
  },
}
