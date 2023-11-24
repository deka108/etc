" enable fzf
set rtp+=/usr/local/opt/fzf

" enable syntax highlighting
syntax enable

" filetype
filetype plugin indent on

" set number
set number

" set space
set ts=4 sw=4

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'dense-analysis/ale'
  Plug 'derekwyatt/vim-scala'
  Plug 'junegunn/fzf'
  Plug 'preservim/nerdcommenter'
  Plug 'preservim/nerdtree'
  Plug 'vim-scripts/AnsiEsc.vim'
  Plug 'tpope/vim-fugitive'
call plug#end()
