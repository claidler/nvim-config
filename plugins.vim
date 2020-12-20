call plug#begin('~/.vim/plugged')

"****** Syntax Highlighters ******
Plug 'ekalinin/Dockerfile.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'lumiliet/vim-twig'
Plug 'kchmck/vim-coffee-script'
Plug 'jparise/vim-graphql'
Plug 'MaxMEllon/vim-jsx-pretty' 
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'elzr/vim-json' 

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  


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
Plug 'tjdevries/express_line.nvim'

" for copy/paste files and folders - easier than netrw
Plug 'justinmk/vim-dirvish'

" autosave
Plug '907th/vim-auto-save'
" autopairs
Plug 'jiangmiao/auto-pairs'

" allows access to entire undo history in a tree format (not linear)
Plug 'simnalamburt/vim-mundo'

" close html tags
Plug 'alvan/vim-closetag'

"rest client
Plug 'diepm/vim-rest-console'

" git plugins
Plug 'tpope/vim-fugitive', {'frozen': 1}
Plug 'tpope/vim-dispatch' "for async fugitive
Plug 'rbong/vim-flog'
Plug 'airblade/vim-gitgutter' 
" search
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-vimspector.nvim'
Plug 'nvim-telescope/telescope-project.nvim', {'frozen':1}

"completion/linting
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" themes
Plug 'christianchiarulli/nvcode-color-schemes.vim'
" Plug 'joshdick/onedark.vim'
" Plug 'jacoborus/tender.vim'
" Plug 'romainl/Apprentice'
" Plug 'jonathanfilip/vim-lucius'
" Plug 'sjl/badwolf'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'ghifarit53/tokyonight-vim'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Plug 'patstockwell/vim-monokai-tasty'

" show hex colours
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

" icons
Plug 'kyazdani42/nvim-web-devicons'

" smooth scroll
Plug 'psliwka/vim-smoothie'

" debugger
Plug 'eliba2/vim-node-inspect'

call plug#end()
