

set number
set nobackup

set incsearch
set ignorecase
set updatetime=500

set cursorline

set tabstop=4
set shiftwidth=4
set expandtab

set clipboard=unnamedplus

set foldmethod=syntax
set nofoldenable


startinsert


source ~/.config/nvim/plugins.vim
source ~/.config/nvim/coc-settings.vim





" executes file based on extension


function RunFile()
	let s:extension = expand('%:e')
        let s:extmap = {
			\ "js": ":!node %:p",
			\ "py": ":!python %:p",
			\ "php": ":!php %:p",
			\ "c": ":!gcc %:p -L $PREFIX/include -o %:r && ./%:r",
            \ "cpp": ":!gcc %:p -L $PREFIX/include -o %:r && ./%:r",
			\ "asm": ":!nasm %:p -f bin -o %:r && ./%:r",
            \ "md": ":Glow",
			\ "html": ":!python -m http.server",
		  \ }


	execute get(s:extmap, s:extension, ":!%:p")

endfunction



"
"
" Keybindings for neovim
"
"



" open file tree

inoremap <C-f> <ESC>:NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeToggle<CR>



" quick save and exit

inoremap <C-s> <ESC>:w<CR>a
inoremap <C-q> <ESC>:q!<CR>

nnoremap <C-s> :w<CR>a
nnoremap <C-q> :q!<CR>



inoremap <A-f> <ESC>:Neoformat<CR>a


" run file
inoremap <C-r> <ESC>:call RunFile()<CR>
nnoremap <C-r> :call RunFile()<CR>



" cut, copy, paste
inoremap <A-d> <ESC>"_ddi
inoremap <A-c> <ESC>yyi
inoremap <A-p> <ESC>pi

" in visual mode
" x to cut
" c to copy
" p to paste
"
vnoremap <A-d> di
vnoremap <A-c> yyi
vnoremap <A-p> pi

" delete selected lines
xnoremap <BS> "_di
snoremap <BS> "_di
vnoremap <BS> "_di


" delete whole line
inoremap <C-BS> <ESC>"_ddi<END>



" undo redo
inoremap <A-u> <ESC>:u<CR>a
inoremap <A-r> <ESC>:redo<CR>a




" move to the top
inoremap <C-HOME> <ESC>ggi

" move to the bottom
" <C-END> default



