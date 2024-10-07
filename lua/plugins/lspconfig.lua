return {
        'neovim/nvim-lspconfig', -- Плагин для настройки LSP
        config = function()
            local lspconfig = require('lspconfig')
            -- Настройка Pyright
            lspconfig.pyright.setup{}
            lspconfig.dartls.setup{} 
        end
}
