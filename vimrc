  set nocompatible              " be iMproved, required

    filetype off                  " required
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'
    Plugin 'git@github.com:slim-template/vim-slim.git'
    Plugin 'git@github.com:tpope/vim-surround.git'
    Plugin 'git@github.com:christoomey/vim-tmux-navigator.git'
    Plugin 'git@github.com:rking/ag.vim.git'
    Plugin 'git@github.com:kien/ctrlp.vim.git'
    Plugin 'git://github.com/tpope/vim-eunuch.git'
    Plugin 'git@github.com:vim-scripts/taglist.vim.git'
    Plugin 'git@github.com:ggreer/the_silver_searcher.git'
    Plugin 'git@github.com:scrooloose/nerdtree.git'
    Plugin 'git@github.com:jistr/vim-nerdtree-tabs.git'
    Plugin 'git@github.com:vim-ruby/vim-ruby.git'
    Plugin 'git@github.com:scrooloose/nerdcommenter.git'
    Plugin 'git@github.com:tpope/vim-endwise.git'
    Plugin 'git@github.com:jiangmiao/auto-pairs.git'
    Plugin 'git@github.com:pangloss/vim-javascript.git'
    Plugin 'git@github.com:mxw/vim-jsx.git'
    Plugin 'git@github.com:jelera/vim-javascript-syntax.git'
    Plugin 'alvan/vim-closetag'
    Plugin 'git@github.com:kchmck/vim-coffee-script.git'
    Plugin 'git@github.com:zephod/vim-iterm2-navigator.git'
    Plugin 'tomasiser/vim-code-dark'
    Plugin 'git@github.com:t9md/vim-ruby-xmpfilter.git'
    Plugin 'epilande/vim-es2015-snippets'
    Plugin 'git@github.com:Valloric/YouCompleteMe.git'

    " React code snippets
    Plugin 'epilande/vim-react-snippets'

    " Ultisnips
    Plugin 'SirVer/ultisnips'

" Trigger configuration (Optional)
    "Plugin 'git@github.com:tpope/vim-fireplace.git'
    "Plugin 'git@github.com:vim-airline/vim-airline.git'
    "Plugin 'vim-airline/vim-airline-themes'
    "Plugin 'NLKNguyen/papercolor-theme'
    call vundle#end()            " required
    filetype plugin indent on    " required

let g:closetag_filenames = "*.html,*.xhtml,*.jsx,*.js"
let g:ruby_path = system('echo ~/.rbenv/shims')
let fortran_have_tabs=1
let g:jsx_ext_required = 0
let g:ctrlp_use_caching = 0
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog ='/Library/Frameworks/Python.framework/Versions/3.6/bin/python3.6'
let g:UltiSnipsExpandTrigger="<C-l>"
nmap <buffer> <C-T> <Plug>(xmpfilter-run)
xmap <buffer> <C-T> <Plug>(xmpfilter-run)
imap <buffer> <C-T> <Plug>(xmpfilter-run)

nmap <buffer> <C-c> <Plug>(xmpfilter-mark)
xmap <buffer> <C-c> <Plug>(xmpfilter-mark)
imap <buffer> <C-c> <Plug>(xmpfilter-mark)
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif
set clipboard=unnamedplus
set noswapfile
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set nocompatible
set modifiable
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul
set t_Co=256
let fortran_have_tabs=1
let g:auto_save = 0

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set synmaxcol=128

let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
filetype plugin indent on

source ~/.vim/vimrc.before
call clearmatches()
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  let g:ctrlp_use_caching = 0
endif
let NERDTreeShowHidden=1
set relativenumber
set number
autocmd BufNewFile,BufRead *.slim set ft=slim
set smarttab
set expandtab
set shiftwidth=2
set softtabstop=2
syntax enable

set background=light
colorscheme monokai
colorscheme codedark
set guifont=Ubuntu\ Mono\ 15

fu! s:GetCurrentCursorTag()

    let c_col  = col('.')
    let matched = matchstr(getline('.'), '\(<[^<>]*\%'.c_col.'c.\{-}>\)\|\(\%'.c_col.'c<.\{-}>\)')
    if matched =~ '/>$'
        return ""
    elseif matched == ""
        " The tag itself may be spread over multiple lines.
        let matched = matchstr(getline('.'), '\(<[^<>]*\%'.c_col.'c.\{-}$\)\|\(\%'.c_col.'c<.\{-}$\)')
        if matched == ""
            return ""
        endif
    endif

    let tagname = matchstr(matched, '<\zs/\?\%([[:alpha:]_:]\|[^\x00-\x7F]\)\%([-._:[:alnum:]]\|[^\x00-\x7F]\)*')
    return tagname
endfu
let g:ag_working_path_mode="r"

set listchars=trail:·
fu! s:HighlightTagAtPosition(position)
    if a:position == [0, 0]
        return
    endif

    let [m_lnum, m_col] = a:position
    exe '2match MatchParen /\(\%' . m_lnum . 'l\%' . m_col .  'c<\zs.\{-}\ze[\n >]\)\|'
                \ .'\(\%' . line('.') . 'l\%' . col('.') .  'c<\zs.\{-}\ze[\n >]\)\|'
                \ .'\(\%' . line('.') . 'l<\zs[^<> ]*\%' . col('.') . 'c.\{-}\ze[\n >]\)\|'
                \ .'\(\%' . line('.') . 'l<\zs[^<>]\{-}\ze\s[^<>]*\%' . col('.') . 'c.\{-}[\n>]\)/'
    let w:tag_hl_on = 1
endfu
