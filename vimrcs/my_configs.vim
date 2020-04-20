"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" venjiang's nvim config "
"                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))
"  if (has("nvim"))
"    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"  endif
"  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"  if (has("termguicolors"))
"    set termguicolors
"  endif
"endif
" 行号
set nu
" 相对行号
set relativenumber
augroup relative_number
    autocmd!
    " autocmd InsertEnter * :set norelativenumber
    " autocmd InsertLeave * :set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    " Fix syntax highlighting
    autocmd BufEnter * :syntax sync fromstart
augroup END
" 行号背景
hi LineNr ctermbg=235 
" 列标尺
" set colorcolumn=80
" hi ColorColumn ctermbg=237
" set autowrite
set updatetime=100
" 关闭错误提示音 
set vb t_vb=
" 鼠标支持
set mouse=a
" 退出后显示内容
" set t_ti= t_te=
" au BufWinLeave * silent mkview
" au BufWinEnter * silent loadview

" 高亮
hi Cursor cterm=reverse ctermbg=22
set cursorline
hi CursorLine   cterm=NONE ctermbg=237 ctermfg=none 
hi LineNr term=underline ctermfg=249 ctermbg=235 guifg=#b0b0b0
hi CursorLineNr term=bold ctermfg=214 gui=bold guifg=Yellow
hi SyntasticErrors cterm=none ctermbg=darkred
hi QuickFixLine cterm=none ctermfg=8 ctermbg=52
hi Normal ctermfg=254 ctermbg=234 guifg=#d0d0d0 guibg=#202020
hi MatchParen ctermfg=15 ctermbg=2 gui=underline guifg=#61AFEF
" hi MatchParen term=reverse ctermbg=90 guibg=#800080
" let g:airline_theme='onedark'
" 分隔条
hi VertSplit ctermfg=8 ctermbg=234 guifg=#e0e0e0 guibg=#000000
" 注释
hi Comment ctermfg=66  
" 非文本
" hi NonText  ctermfg=7
" guibg=76 guifg=white
" buffer next/previous
unmap <leader>l
unmap <leader>h
map <leader>bl :bnext<cr>
map <leader>bh :bprevious<cr>
" Fast saving
unmap <leader>w
nmap <leader>s :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
unmap <space>
unmap <c-space>
 unmap <leader>n
" unmap <leader>p
unmap <leader>m
" map <leader>p :cp<cr>
" map <leader>n :lnext<CR>
" map <leader>m :lprevious<CR>
" map <c-n> :cnext<cr>
" map <c-m> :cprevious<cr>
map <c-n> :lnext<cr>
map <c-m> :lprevious<cr>
unmap <leader>pp
noremap <leader>c  :close<cr>
noremap oo  o<Esc>
noremap ii  i<cr><Esc>
noremap <space><space>  i<space><Esc>
" 编辑
inoremap <c-f> <right>
inoremap <c-l> <right>
inoremap <c-b> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <delete>
" ESC
inoremap jk <Esc>
" inoremap <Esc> <Nop>

" tab
noremap <leader>1  :tabn1<cr>
noremap <leader>2  :tabn2<cr>
noremap <leader>3  :tabn3<cr>
noremap <leader>4  :tabn4<cr>
noremap <leader>5  :tabn5<cr>
noremap <leader>6  :tabn6<cr>
noremap <leader>7  :tabn7<cr>
noremap <leader>8  :tabn8<cr>
noremap <leader>9  :tabn9<cr>
" 终端
hi Terminal ctermfg=84
noremap <leader>t  :botright vertical terminal<cr>

" close comfortable-motion
let g:loaded_comfortable_motion = 0
" insert current datetime
iab xdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>a ggvG
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-expand-region 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-easymotion 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_smartcase = 1
" let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)
map <Leader>. <Plug>(easymotion-repeat)
nmap f <Plug>(easymotion-bd-fl)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Bidirectional & within line 't' motion
nmap t <Plug>(easymotion-bd-tl)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Gif config
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)


" vim-sneak
" map f <Plug>Sneak_s
" map F <Pslug>Sneak_S
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 有道词典
" 在普通模式下，按 ctrl+t， 会翻译当前光标下的单词；
" 在 visual 模式下选中单词或语句，按 ctrl+t，会翻译选择的单词或语句；
" 点击引导键再点y，d，可以在命令行输入要翻译的单词或语句；
" 译文将会在编辑器底部的命令栏显示。
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vnoremap <silent> <C-T> :<C-u>Ydv<CR>
" nnoremap <silent> <C-T> :<C-u>Ydc<CR>
vnoremap <silent> <leader>yt :<C-u>Ydv<CR>
nnoremap <silent> <leader>yt :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 1
au BufNewFile,BufRead *.html set syntax=gohtmltmpl 
" au BufNewFile,BufRead *.html set syntax=gohtmltmpl filetype=html
let g:go_fmt_command = "goimports"
" let g:go_fmt_command = "gopls"
let g:go_fmt_fail_silently = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_metalinter_autosave = 0
let g:go_metalinter_command='gopls'
let g:go_gopls_staticcheck = 1
" autocmd BufWritePost *.go call go#lint#Golint(1)
let g:go_metalinter_deadline = "5s"
" let g:go_metalinter_enabled = ['vet','errcheck','golint']
let g:go_asmfmt_autosave = 0
" let g:go_list_type = "quickfix"
let g:go_list_type = "locationlist"
let g:go_list_height = 3
" Lncp<cr>location list
" map <leader>n :lnext<CR>
" map <leader>p :lprevious<CR>
let g:go_auto_type_info = 1
let g:go_auto_sameids = 0
let g:go_jump_to_error = 0


autocmd FileType go nmap <leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <leader>rs <Plug>(go-run-split)
au FileType go nmap <leader>rv <Plug>(go-run-vertical)
autocmd FileType go nmap <leader>tt  <Plug>(go-test)
autocmd FileType go nmap <leader>tf  <Plug>(go-test-func)
autocmd FileType go nmap <leader>a  :GoAlternate<CR>

au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
" au FileType go nmap <leader>s <Plug>(go-implements)
" au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>e <Plug>(go-rename)　

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdtree-git-plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeShowIgnoredStatus = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctrlp-funky 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
unmap <leader>j 

""""""""""""""""""""""""""""""
" => vue.js
""""""""""""""""""""""""""""""
" autocmd FileType vue syntax sync fromstart
" let g:vue_disable_pre_processors=1


""""""""""""""""""""""""""""""
" => vim-easy-align
""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


""""""""""""""""""""""""""""""
" => indentLine
""""""""""""""""""""""""""""""
" let g:indentLine_color_term = 239
" Background (Vim, GVim)
" let g:indentLine_bgcolor_term = 202
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setConceal = 0

""""""""""""""""""""""""""""""
" => vlang
""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.v,*.vh	setf vlang

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" -------------------------------------------------------------------------------------------------
"  others settings
" -------------------------------------------------------------------------------------------------

