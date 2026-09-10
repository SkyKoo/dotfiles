local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local output = vim.fn.system({
        'git', 'clone', '--filter=blob:none', '--branch=stable',
        'https://github.com/folke/lazy.nvim.git', lazypath,
    })
    if vim.v.shell_error ~= 0 then
        error('Failed to install lazy.nvim:\n' .. output)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { 'tanvirtin/monokai.nvim' },
    {
        'p00f/alabaster.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('colorscheme')
        end,
    },

    { 'williamboman/mason.nvim', lazy = false },
    {
        'williamboman/mason-lspconfig.nvim',
        lazy = false,
        dependencies = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig',
        },
    },
    { 'neovim/nvim-lspconfig', lazy = false },

    {
        'hrsh7th/nvim-cmp',
        lazy = false,
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        },
        config = function()
            require('config.nvim-cmp')
        end,
    },

    {
        'kyazdani42/nvim-tree.lua',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
    },

    {
        'OXY2DEV/markview.nvim',
        lazy = false,
        opts = {
            preview = {
                filetypes = { 'markdown' },
                modes = { 'n', 'no', 'c' },
                hybrid_modes = {},
            },
        },
        keys = {
            { '<leader>v', '<cmd>Markview toggle<cr>', ft = 'markdown', desc = 'Toggle Markdown preview' },
            { '<leader>V', '<cmd>Markview splitToggle<cr>', ft = 'markdown', desc = 'Toggle Markdown split preview' },
        },
    },
}, {
    -- Preserve eager loading where existing configuration requires plugin modules.
    defaults = { lazy = false, version = false },
    checker = { enabled = false },
    rocks = { enabled = false },
})
