"Load plugins
source ~/.config/nvim/plugins.vim

"Load theme
source ~/.config/nvim/plugin-settings/theme.vim

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
set undolevels=2000 "number of undos to save

" ****** Autoclose html tags ******
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.tsx"
let g:closetag_emptyTags_caseSensitive = 1

" Text wrapping
set linebreak
set wrap
set whichwrap=b,h,l,s,<,>,[,],~       " What to allow to cross line boundaries
set linebreak                         " break long lines

" ****** General ******
set autoindent
set relativenumber
set softtabstop=0 noexpandtab
set shiftwidth=2
set tabstop=2
set mouse=a
set noswapfile
set nobackup
set nowritebackup
set wildignore=*/.git/*,*/node_modules/*,*/dist/*,*/build/*
set ttimeoutlen=0
set smartcase
set ignorecase
set lazyredraw
set signcolumn=yes
set termguicolors
set pumblend=20
set winblend=5

" improve updatetime - could reduce performance
set updatetime=300

" remap escape
inoremap jk <Esc>

highlight Pmenu ctermbg=Black guibg=#364d63
highlight PmenuSel ctermbg=Black guibg=#364d63 ctermfg=White guifg=White

let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'

let g:session_dir = '~/.vim-sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

" recognise tsx/ts files
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx


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
" source ~/.config/nvim/plugin-settings/fzf.vim

" Lsp Neovim
luafile ~/.config/nvim/lsp.lua

" Telescope
luafile ~/.config/nvim/telescope.lua

" ExpressLine
" luafile ~/.config/nvim/expressline.lua
luafile ~/.config/nvim/galaxyline.lua

" Dirvish
source ~/.config/nvim/plugin-settings/dirvish.vim

" GitSigns
luafile ~/.config/nvim/plugin-settings/gitsigns.lua

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
set shortmess+=c
let g:completion_chain_complete_list = {
\ 'scss' :[ { 'complete_items': ['lsp'] }, {'mode': 'omni'} ],
\ 'default' :[
    \{'complete_items': ['lsp']},
    \{'complete_items': ['snippet', 'path']},
    \{'complete_items': [ 'buffers' ]},
    \{'mode': 'file'},
\]
\}
let g:completion_auto_change_source = 1
autocmd BufEnter * lua require'completion'.on_attach()

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
imap <expr> <A-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
imap <expr> <A-l>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'

" Treesitter
luafile ~/.config/nvim/plugin-settings/treesitter.lua

" autochdir alternative for dirvish
autocmd BufEnter * silent! lcd %:p:h

let g:auto_save = 1  " enable AutoSave on Vim startup

nnoremap <silent> <A-d> :FloatermNew<CR>
tnoremap <silent> <A-d> <C-\><C-n>:FloatermKill<CR>

nnoremap <silent> <A-f> :Farf<CR>
nnoremap <silent> <A-r> :Farr<CR>

let g:signify_sign_add = '▋'
let g:signify_sign_change = '▋'
let g:signify_sign_delete = '▋'
let g:signify_sign_delete_first_line = '▘'
let g:signify_sign_show_count = 0
" Fancy custom header
let g:dashboard_default_executive ='telescope'
let g:dashboard_preview_command="cat"
let g:dashboard_preview_file="~/.config/nvim/dashboard/tiger.txt"
let g:dashboard_preview_pipeline="lolcat"
let g:dashboard_preview_file_width=80
let g:dashboard_preview_file_height=25

let g:indicator_errors = "\uf05e "
let g:indicator_warnings = "\uf071 "
let g:indicator_infos = "\uf7fc "
let g:indicator_hints = "\ufbe6 "

" lsp diagnostics indicators
call sign_define("LspDiagnosticsSignError", {"text" : g:indicator_errors, "texthl" : "LspDiagnosticsDefaultError"})
call sign_define("LspDiagnosticsSignWarning", {"text" : g:indicator_warnings, "texthl" : "LspDiagnosticsDefaultWarning"})
call sign_define("LspDiagnosticsSignInformation", {"text" : g:indicator_infos, "texthl" : "LspDiagnosticsDefaultInformation"})
call sign_define("LspDiagnosticsSignHint", {"text" : g:indicator_hints, "texthl" : "LspDiagnosticsDefaultHint"})

"Shortcuts split navigation:
nnoremap <silent> <A-h> <C-w>h
nnoremap <silent> <A-j> <C-w>j
nnoremap <silent> <A-k> <C-w>k
nnoremap <silent> <A-l> <C-w>l
