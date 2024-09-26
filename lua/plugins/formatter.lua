return {
    { 'mhartington/formatter.nvim', 
      config = function()
        -- Настройка formatter.nvim
        require('formatter').setup({
            logging = false,
            filetype = {
                python = {
                    function()
                        return {
                            exe = "black",
                            args = { "-" },
                            stdin = true
                        }
                    end
                }
            }
        })
        
        -- Автокоманда для форматирования при сохранении
        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.py" },
            callback = function()
                vim.cmd("FormatWrite")
            end
        })
      end
    }
}

