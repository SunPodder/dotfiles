let g:coc_global_extensions = [
  \  'coc-tsserver',
  \  'coc-json',
  \  'coc-css',
  \  'coc-eslint',
  \  'coc-pyright',
  \  'coc-html',
  \  'coc-emmet',
  \  'coc-clangd',
  \  'coc-htmldjango',
  \  '@yaegassy/coc-intelephense',
  \  'coc-rust-analyzer',
  \  '@yaegassy/coc-tailwindcss3'
  \ ]


" accepts current autocompletion selection on ENTER

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


"
" coc extension keymaps
"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>

nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

nmap <leader>do <Plug>(coc-codeaction)

nmap <leader>rn <Plug>(coc-rename)
