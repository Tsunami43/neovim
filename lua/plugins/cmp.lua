return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'L3MON4D3/LuaSnip', 
    },
    config = function()
        local cmp = require('cmp')
        local lspconfig = require('lspconfig')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')

        -- Настройка nvim-cmp
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- Используем LuaSnip
                end,
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' },
                { name = 'cmdline' },
            },
            mapping = {
                ['<A-k>'] = cmp.mapping.select_prev_item(),
                ['<A-j>'] = cmp.mapping.select_next_item(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            },
        })

        -- Настройка LSP и интеграция с nvim-cmp
        local capabilities = cmp_nvim_lsp.default_capabilities()

        lspconfig.pyright.setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                -- Настройка автоподстановки
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                
                -- Показ подсказок при вводе аргументов функции
                vim.api.nvim_create_autocmd("CursorHoldI", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.signature_help()
                    end,
                })
            end,
        })
    end
}

