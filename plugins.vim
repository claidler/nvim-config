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
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dotenv'

" better surround
Plug "machakann/vim-sandwich" 

" nicer command bar
Plug 'tjdevries/express_line.nvim'

" for copy/paste files and folders - easier than netrw
Plug 'justinmk/vim-dirvish'

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
Plug 'lewis6991/gitsigns.nvim'

" search
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-vimspector.nvim'
Plug 'nvim-telescope/telescope-project.nvim', {'frozen':1}
Plug 'brooth/far.vim'

"completion/linting
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'hrsh7th/vim-vsnip-integ'

"statusline
Plug 'glepnir/galaxyline.nvim'

" themes
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'glepnir/zephyr-nvim'

"indent for neovim
Plug 'glepnir/indent-guides.nvim'

" show hex colours
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

" icons
Plug 'kyazdani42/nvim-web-devicons'

" smooth scroll
Plug 'psliwka/vim-smoothie'
Plug 'rhysd/accelerated-jk'

" terminal
Plug 'voldikss/vim-floaterm'

" debugger
Plug 'eliba2/vim-node-inspect'

" start screen
Plug 'cjjlaidler/dashboard-nvim'
call plug#end()
