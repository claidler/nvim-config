call plug#begin('~/.vim/plugged')

"****** Syntax Highlighters ******
Plug 'ekalinin/Dockerfile.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'lumiliet/vim-twig'
Plug 'kchmck/vim-coffee-script'
Plug 'jparise/vim-graphql'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'freitass/todo.txt-vim'
Plug 'jparise/vim-graphql'
Plug 'cakebaker/scss-syntax.vim'
Plug 'elzr/vim-json' 

" Don't forget about tree-sitter but it's not ready yet
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

"****** Other Plugins ******
" popes stuff
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dotenv'

" nicer command bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" for copy/paste files and folders - easier than netrw
" Plug 'mcchrish/nnn.vim'
Plug 'justinmk/vim-dirvish'

" allows access to entire undo history in a tree format (not linear)
Plug 'simnalamburt/vim-mundo'

" close html tags
Plug 'alvan/vim-closetag'

"rest client
Plug 'diepm/vim-rest-console'

" git plugins
Plug 'tpope/vim-fugitive', {'frozen': 1}
Plug 'rbong/vim-flog'
Plug 'airblade/vim-gitgutter' 
" search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'benwainwright/fzf-project'

"completion/linting
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'antoinemadec/coc-fzf'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'gfanto/fzf-lsp.nvim'
" Plug 'dense-analysis/ale'

" themes
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'
Plug 'romainl/Apprentice'
Plug 'jonathanfilip/vim-lucius'
Plug 'sjl/badwolf'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'patstockwell/vim-monokai-tasty'

" show hex colours
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

" icons
Plug 'ryanoasis/vim-devicons'

" debugger
Plug 'eliba2/vim-node-inspect'

call plug#end()
