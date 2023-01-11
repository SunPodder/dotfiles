call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'github/copilot.vim'
Plug 'vim-airline/vim-airline'
Plug '1995eaton/vim-better-javascript-completion'
Plug 'segeljakt/vim-silicon'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'preservim/tagbar'
Plug 'sbdchd/neoformat'

Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/vim-jsx-improve'
Plug 'leafgarland/typescript-vim'

" assembly
Plug 'shirk/vim-gas'

Plug 'hsanson/vim-android'

" markdown preview
Plug 'ellisonleao/glow.nvim'
Plug 'ap/vim-css-color'

" extra c featues (lex, bison)
Plug 'justinmk/vim-syntax-extra'

Plug 'mfussenegger/nvim-dap'
Plug 'dsawardekar/wordpress.vim'

Plug 'leafOfTree/vim-matchtag'
Plug 'turbio/bracey.vim'

Plug 'evanleck/vim-svelte'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'codechips/coc-svelte', {'do': 'npm install'}

Plug 'shawncplus/phpcomplete.vim'

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tanvirtin/monokai.nvim'

Plug 'ryanoasis/vim-devicons'

call plug#end()



"colorscheme dracula
colorscheme monokai_pro

autocmd FileType scss setl iskeyword+=@-@



let g:AutoPairsFlyMode = 0

let g:vim_matchtag_files = "*.html,*.svelte,*.xml,*.svg,*.jsx"
let g:vim_matchtag_highlight_cursor_on = 1


let g:copilot_enabled = v:false
let g:copilot_filetypes = {
                            \ 'markdown': v:true,
                            \ 'yaml': v:true,
                        \ }


let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:vimjs#chromeapis = 1

let g:bracey_auto_start_browser = 0
let g:bracey_refresh_on_save = 1
let g:bracey_server_log = "/data/data/com.termux/files/usr/tmp/bracey"
let g:bracey_server_path = "http://127.0.0.1"
let g:bracey_server_port = 3000


let g:silicon = {
      \   'theme':              'Dracula',
      \   'font':               'Hack',
      \   'background':         '#AAAAFF',
      \   'shadow-color':       '#555555',
      \   'line-pad':                   2,
      \   'pad-horiz':                 80,
      \   'pad-vert':                 100,
      \   'shadow-blur-radius':         0,
      \   'shadow-offset-x':            0,
      \   'shadow-offset-y':            0,
      \   'line-number':           v:true,
      \   'round-corner':          v:true,
      \   'window-controls':       v:true,
      \   'output':                '~/storage/shared/Pictures/Vim/{time:%Y-%m-%d-%H%M%S}.png',
      \ }


