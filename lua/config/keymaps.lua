vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }


map('', '<A-q>', '<Esc>', opts)
-- Переместиться к первому символу строки (Shift + H)
map('n', '<S-h>', '^', opts)

-- Переместиться к последнему символу строки (Shift + L)
map('n', '<S-l>', 'g_', opts)-- Настройка горячих клавиш в визуальном режиме

-- Функция для сдвига строк вправо
map('v', '<C-A-l>', ':\'<,\'>normal! >><CR> V\'<,\'>', opts)

-- Функция для сдвига строк влево
map('v', '<C-A-h>', ':\'<,\'>normal! <<<CR> V\'<,\'>', opts)

-- Функция для сдвига строк вверх
map('v', '<C-A-k>', ':\'<,\'>move -2<CR>gv', opts)

-- Функция для сдвига строк вниз
map('v', '<C-A-j>', ":move '>+1<CR>gv=gv", opts)

-- Примеры привязок клавиш
map('n', '<C-s>', ':w<CR>', opts) -- Сохранение файла по Ctrl+s
map('n', '<C-q>', ':q<CR>', opts) -- Выход из файла по Ctrl+q

-- Открытие/фокусировка neo-tree
map('n', '<A-e>', ':Neotree toggle<CR>', opts)  -- Открыть или закрыть neo-tree


-- Сдвинуть строку влево
map('n', '<C-A-h>', '<<', opts)

-- Сдвинуть строку вправо
map('n', '<C-A-l>', '>>', opts)

-- Перемещение строки вниз
map('n', '<C-A-j>', ':m .+1<CR>==', opts)

-- Перемещение строки вверх
map('n', '<C-A-k>', ':m .-2<CR>==', opts)

-- Переход между окнами по Ctrl+h/j/k/l
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- bufferline
map('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)
-- Закрыть текущий буфер с сохранением остальных
map('n', '<A-c>', ':bdelete<CR>', opts)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<A-b>', builtin.find_files, opts)
vim.keymap.set('n', '<A-f>', builtin.current_buffer_fuzzy_find, opts)

-- Установите видимость 5 строк при перемещении вверх или вниз
vim.o.scrolloff = 5


-- Перемещение на 20 строк вниз с помощью Shift+jk
map('n', '<S-j>', '10j', opts)
-- Перемещение на 20 строк вверх с помощью Shift+kj
map('n', '<S-k>', '10k', opts)

-- Перейти к определению
map('n', '<A-g>', ':lua vim.lsp.buf.definition()<CR>', opts)
-- Вернуться назад
map('n', '<leader>gD', ':lua vim.lsp.buf.references()<CR>', opts)

-- Открытие нового окна в tmux
map('n', '<A-t>', ':!tmux new-window<CR>', opts)

-- Функция для поиска текущего слова
function search_current_word()
  local word = vim.fn.expand('<cword>')  -- Получить текущее слово под курсором
  vim.cmd('execute "normal! /' .. word .. '\\<CR>"')  -- Выполнить поиск
end
-- Поиск текущего слова с помощью Alt+v
map('n', '<A-v>', ':lua search_current_word()<CR>', opts)



-- Установить новую комбинацию клавиш для 'n'
map('n', '<A-j>', 'n', opts) 

-- Установить новую комбинацию клавиш для 'p'
map('n', '<A-k>', 'N', opts)


-- Переназначение отмены изменений
map('n', '<A-h>', 'u', opts)

-- Переназначение повторения отмененных изменений
map('n', '<A-l>', '<C-r>', opts)


-- Открыть tmux в нижней части экрана
vim.api.nvim_create_user_command('TmuxSplit', function()
  vim.cmd('vsplit') -- Создаем новый вертикальный сплит
  vim.cmd('resize 20') -- Устанавливаем размер сплита
  vim.cmd('term tmux') -- Открываем tmux в терминале
  vim.cmd('resize 30') -- Изменяем размер сплита на треть экрана
end, {})


-- Выделить вниз на 10 строк (Alt + j)
map('v', '<S-j>', '10j',  opts)

map('v', '<S-h>', '^',  opts)
map('v', '<S-l>', 'g_',  opts)


-- Выделить вверх на 10 строк (Alt + k)
map('v', '<S-k>', '10k',  opts)

map('o', 'H', '^', opts)

map('o', 'L', 'g_', opts)

map('n', '<A-d>', '<C-o>', opts)
map('n', '<CR>', 'o<Esc>', opts)
