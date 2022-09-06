set nocompatible
filetype off


" Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() 
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'https://github.com/ycm-core/YouCompleteMe'
  Plugin 'frazrepo/vim-rainbow'
call vundle#end()
filetype plugin indent on

" vim-plug
call plug#begin()
  Plug 'sheerun/vim-polyglot'
  Plug 'joshdick/onedark.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'mattn/emmet-vim'
  Plug 'alvan/vim-closetag'
  Plug 'honza/vim-snippets'
  Plug 'preservim/nerdtree', { 'on' : 'NERDTreeToggle' }
  Plug 'https://github.com/tpope/vim-commentary'
  Plug 'https://github.com/terryma/vim-multiple-cursors'
  Plug 'https://github.com/tpope/vim-surround'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'https://github.com/SirVer/ultisnips'
  Plug 'https://github.com/skywind3000/asyncrun.vim'
  Plug 'https://github.com/airblade/vim-gitgutter'
  Plug 'junegunn/vim-easy-align'
  Plug 'https://github.com/bfrg/vim-cpp-modern'
  Plug 'https://github.com/sainnhe/everforest'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'navarasu/onedark.nvim'
  Plug 'https://github.com/xiyaowong/nvim-transparent'
  Plug 'https://github.com/dense-analysis/ale'
  Plug 'https://github.com/akinsho/bufferline.nvim'
  Plug 'https://github.com/romgrk/barbar.nvim'
call plug#end()


" custom commands:
  " save file, compile and run (only works with c++ currently)
  command  Rhere  w | AsyncRun g++ --std=c++11 % | ./a.out

" EasyAlign
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)


" swap windows with tab instead of <C-w>w
nmap <Tab> <C-w>w

" disable git gutter by default
let g:gitgutter_enabled = 0

" highlight line cursor is one
set cursorline

" see those numbers on the left yeah? this setting does that ;)
set number

" vim integration of clang formatter
map <C-K> :py3f /opt/homebrew/Cellar/llvm/14.0.6_1/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:py3f /opt/homebrew/Cellar/llvm/14.0.6_1/share/clang/clang-format.py<cr>

function! Formatonsave()
  let l:formatdiff = 1
  py3f /opt/homebrew/Cellar/llvm/14.0.6_1/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()


" vim implementation of auto brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


" use homebrew's cland for YCM
let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'

" theme
colorscheme onedark

" lightline config (that line at the bottom)
  " to enable the lightline
  set laststatus=2
  let g:lightline = {'colorscheme' : 'onedark'}



