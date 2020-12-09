"Load plugins
source ~/.config/nvim/plugins.vim

"Load theme
source ~/.config/nvim/settings/theme.vim

" ale settings
" let b:ale_fixers = ['prettier', 'eslint']
" let g:ale_fix_on_save = 1
" let g:ale_virtualtext_cursor = 1
" let g:ale_set_highlights = 1
" highlight ALEVirtualTextStyleWarning ctermbg=DarkYellow
" highlight ALEVirtualTextStyleError ctermbg=DarkMagenta

" undotree toggle
nnoremap <F5> :MundoToggle<CR>

" save undo info in specified location and allow it to persist
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

" ****** Autoclose html tags ******
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.tsx"
let g:closetag_emptyTags_caseSensitive = 1

" ****** General ******
set autoindent
set relativenumber
set softtabstop=0 noexpandtab
set shiftwidth=2
set tabstop=2
set mouse=a
set noswapfile
set wildignore=*/.git/*,*/node_modules/*,*/dist/*,*/build/*
set ttimeoutlen=0
set smartcase
set ignorecase
set lazyredraw
set termguicolors

let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'

let g:session_dir = '~/.vim-sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

" recognise tsx/ts files
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" show cursorline on selected window only
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" ****** Netrw File Explorer ******
" open netrw at the last opened location
let g:netrw_keepdir=0

" ****** Git ******
" Default to not read-only in vimdiff
set noro"
" Diff always in vertical splits
set diffopt+=vertical

" Fix for kitty terminal
let &t_ut=''

" Use system clipboard
set clipboard=unnamedplus

let mapleader=" "

" FZF
source ~/.config/nvim/settings/fzf.vim

" Personal stuff
source ~/.config/nvim/settings/personal.vim

" Coc 
" source ~/.config/nvim/settings/coc.vim
" Lsp neovim
luafile ~/.config/nvim/settings/lsp.lua

" Dirvish
source ~/.config/nvim/settings/dirvish.vim

" Docker
source ~/.config/nvim/settings/docker-compose.vim

"Hungry backspace
inoremap <silent><expr><bs> 
  \ (&indentexpr isnot '' ? &indentkeys : &cinkeys) =~? '!\^F' &&
  \ &backspace =~? '.*eol\&.*start\&.*indent\&' &&
  \ !search('\S','nbW',line('.')) ? (col('.') != 1 ? "\<C-U>" : "") .
  \ "\<bs>" . (getline(line('.')-1) =~ '\S' ? "" : "\<C-F>") : "\<bs>"


" execute db command
function! s:env(var) abort
  return exists('*DotenvGet') ? DotenvGet(a:var) : eval('$'.a:var)
endfunction

let db_url = s:env('DADBOD_URL') 

command! -nargs=1 D execute "DB " . s:env('DADBOD_URL') . " " <q-args> 
command! -nargs=1 DSel execute "DB " . s:env('DADBOD_URL') . " SELECT * FROM " <q-args> | norm! <C-W>j
command! -nargs=1 DDel execute "DB " . s:env('DADBOD_URL') . " DELETE FROM " <q-args> | pclose

set splitbelow
" curl rest arguments
let g:vrc_curl_opts = {
      \ '--connect-timeout' : 10,
      \ '-b': '/tmp/cookies',
      \ '-c': '/tmp/cookies',
      \ '-L': '',
      \ '-i': '',
      \ '--max-time': 60,
      \ '--ipv4': '',
      \ '-k': '',
    \}

" make vim shell know about bash aliases
let $BASH_ENV="~/.aliases/main.sh" 
" get jira tasks
nnoremap <silent> <leader>j :! j<CR>
command! -nargs=1 JV execute "! jv " <q-args> 
nnoremap <silent> <leader>v :JV<space>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
autocmd BufEnter * lua require'completion'.on_attach()
let g:completion_enable_auto_popup = 1
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" autocmd BufWritePre *.tsx,*.ts lua vim.lsp.buf.formatting_sync(nil, 1000)
" set autoread

" treesitter code
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF
