-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  { 'tpope/vim-fugitive', vim.keymap.set('n', '<leader>g', ':0G<CR>', { desc = 'Fu[g]itive' }) },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' }),
  },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    event = 'VeryLazy',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    'folke/ts-comments.nvim',
    opts = {},
    event = 'VeryLazy',
    enabled = vim.fn.has 'nvim-0.10.0' == 1,
  },
  {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {},
    config = function()
      require('fzf-lua').setup {
        -- Add your fzf-lua configurations here
        winopts = {
          height = 0.85,
          width = 0.80,
          border = 'rounded',
        },
        grep = {
          rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e --fixed-strings',
        },
      }

      local keymaps = {
        { '<leader>sf', 'files', 'Find Files (fzf-lua)' },
        { '<leader>sg', 'live_grep', 'Live Grep (fzf-lua)' },
        { '<leader><leader>', 'buffers', 'Find Buffers (fzf-lua)' },
        { '<leader>sh', 'help_tags', 'Find Help (fzf-lua)' },
        { '<leader>sk', 'keymaps', 'Find Keymaps (fzf-lua)' },
        { '<leader>ss', 'builtin', 'Select FZF Builtins (fzf-lua)' },
        { '<leader>sw', 'grep_cword', 'Search Word Under Cursor (fzf-lua)' },
        { '<leader>sd', 'diagnostics', 'Search Diagnostics (fzf-lua)' },
        { '<leader>sr', 'resume', 'Resume Last Search (fzf-lua)' },
        { '<leader>s.', 'oldfiles', 'Find Recent Files (fzf-lua)' },
      }

      for _, map in ipairs(keymaps) do
        local key, func, desc = unpack(map)
        vim.keymap.set('n', key, function()
          require('fzf-lua')[func]()
        end, { desc = desc })
      end
    end,
  },
  {
    'ggml-org/llama.vim',
  },
}
