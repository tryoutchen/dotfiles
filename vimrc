
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set smartindent
set smartindent shiftwidth=4
set ruler
set number
syntax on

set incsearch
set hlsearch
set tabstop=4  
set shiftwidth=4  

" Press F8 to enable taglist
nnoremap <silent> <F8> :TlistToggle<CR><CR>
let Tlist_Show_One_File=0                    " 只显示当前文件的tags
let Tlist_Exit_OnlyWindow=1                  " 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window=0                 " 在右侧窗口中显示
let Tlist_File_Fold_Auto_Close=1             " 自动折叠
