
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VBundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand('~/.vim/bundle/Vundle.vim/autoload/vundle.vim'))
  set nocompatible              " be iMproved, required
  filetype off                  " required
  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " The following are examples of different formats supported.
  " Keep Plugin commands between vundle#begin/end.
  " plugin on GitHub repo
  " Plugin 'tpope/vim-fugitive'
  " plugin from http://vim-scripts.org/vim/scripts.html
  " Plugin 'L9'
  " Git plugin not hosted on GitHub
  " Plugin 'git://git.wincent.com/command-t.git'
  " git repos on your local machine (i.e. when working on your own plugin)
  " Plugin 'file:///home/gmarik/path/to/plugin'
  " The sparkup vim script is in a subdirectory of this repo called vim.
  " Pass the path to set the runtimepath properly.
  " Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  " Install L9 and avoid a Naming conflict if you've already installed a
  " different version somewhere else.
  " Plugin 'ascenator/L9', {'name': 'newL9'}
  Plugin 'taglist.vim'
  Plugin 'tryoutchen/quickr-cscope.vim'

  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  " filetype plugin indent on    " required
  " To ignore plugin indent changes, instead use:
  filetype plugin on
  "
  " Brief help
  " :PluginList       - lists configured plugins
  " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
  "
  " see :h vundle for more details or wiki for FAQ
  " Put your non-Plugin stuff after this line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
endif

if has("autocmd")
  " Jump to the last position when reopening a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  " Disable automatic comment insertion
  au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
endif

syntax on
colorscheme elflord
set ruler
set number
" set cursorline
set incsearch
set hlsearch
set tabstop=4  
set shiftwidth=4  
" set laststatus=2 " status line always visible
" set statusline+=%F " display file path

nnoremap <silent> <Space> :let @/ = ""<CR>

" Press F8 to enable taglist
nnoremap <silent> <F8> :TlistToggle<CR><CR>
let Tlist_Show_One_File=0                    " 只显示当前文件的tags
let Tlist_Exit_OnlyWindow=1                  " 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window=0                 " 在右侧窗口中显示
let Tlist_File_Fold_Auto_Close=1             " 自动折叠



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set cscopetag
  set csto=0
  " add any cscope database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  " else add the database pointed to by environment variable
  elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
  endif

  let g:quickr_cscope_keymaps = 0
  let g:quickr_cscope_use_qf_g = 1
  let mapleader = ","

  nmap <leader>fg <plug>(quickr_cscope_global)
  nmap <leader>fs <plug>(quickr_cscope_symbols)
  nmap <leader>fc <plug>(quickr_cscope_callers)
  nmap <leader>ff <plug>(quickr_cscope_files)
  nmap <leader>fi <plug>(quickr_cscope_includes)
  nmap <leader>ft <plug>(quickr_cscope_text)
  nmap <leader>fd <plug>(quickr_cscope_functions)
  nmap <leader>fe <plug>(quickr_cscope_egrep)

  vmap <leader>fg <plug>(quickr_cscope_global)
  vmap <leader>fs <plug>(quickr_cscope_symbols)
  vmap <leader>fc <plug>(quickr_cscope_callers)
  vmap <leader>ff <plug>(quickr_cscope_files)
  vmap <leader>fi <plug>(quickr_cscope_includes)
  vmap <leader>ft <plug>(quickr_cscope_text)
  vmap <leader>fd <plug>(quickr_cscope_functions)
  vmap <leader>fe <plug>(quickr_cscope_egrep)

  nmap <leader>l :botright cwindow<CR>
  vmap <leader>l :botright cwindow<CR>

  command! -bang -nargs=* -complete=file Cs call Quickr_cscope('grep<bang>',<q-args>)
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
