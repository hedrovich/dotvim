  set nocompatible              " be iMproved, required

    filetype off                  " required
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'
    Plugin 'git@github.com:tpope/vim-surround.git'
    Plugin 'git@github.com:christoomey/vim-tmux-navigator.git'
    Plugin 'git@github.com:rking/ag.vim.git'
    Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plugin 'junegunn/fzf.vim'
    "Plugin 'git@github.com:sbdchd/neoformat.git'
    "Plugin 'git@github.com:prettier/vim-prettier.git'
    "Plugin 'git@github.com:vim-scripts/taglist.vim.git'
    Plugin 'git@github.com:scrooloose/nerdtree.git'
    Plugin 'git@github.com:jistr/vim-nerdtree-tabs.git'
    Plugin 'git@github.com:vim-ruby/vim-ruby.git'
    Plugin 'git@github.com:scrooloose/nerdcommenter.git'
    Plugin 'git@github.com:tpope/vim-endwise.git'
    Plugin 'git@github.com:jiangmiao/auto-pairs.git'
    Plugin 'git@github.com:pangloss/vim-javascript.git'
    Plugin 'git@github.com:MaxMEllon/vim-jsx-pretty.git'
    Plugin 'git@github.com:jelera/vim-javascript-syntax.git'
    Plugin 'alvan/vim-closetag'
    Plugin 'tomasiser/vim-code-dark'
    "Plugin 'git@github.com:t9md/vim-ruby-xmpfilter.git'
    "Plugin 'epilande/vim-es2015-snippets'
    "Plugin 'git@github.com:Valloric/YouCompleteMe.git'
    Plugin 'git@github.com:joshdick/onedark.vim.git'
    "Plugin 'git@github.com:styled-components/vim-styled-components.git'
    "Plugin 'yalesov/vim-emblem'
    "Plugin 'thinca/vim-ref'
    Plugin 'Chiel92/vim-autoformat'
    Plugin 'vim-test/vim-test'
    Plugin 'kassio/neoterm'
    "Plugin 'SirVer/ultisnips'
    " React code snippets
    "Plugin 'epilande/vim-react-snippets'
    "


" Trigger configuration (Optional)
    "Plugin 'git@github.com:tpope/vim-fireplace.git'
    "Plugin 'git@github.com:vim-airline/vim-airline.git'
    "Plugin 'vim-airline/vim-airline-themes'
    "Plugin 'NLKNguyen/papercolor-theme'
    call vundle#end()            " required

" spec command

let test#ruby#bundle_exec = 0
let g:neoterm_size = 80
let g:neoterm_focus_when_test_fail = 1
let g:neoterm_autoscroll=1 
let test#ruby#rspec#executable = "RAILS_ENV=test bundle exec rspec"

let g:neoterm_default_mod='botright'
let test#strategy = "neoterm"
autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --parser\ flow
:let &winheight = &lines * 7 / 10
:let &winwidth = &columns * 5 / 8
let g:neoformat_try_formatprg = 1 " Use formatprg when available
let g:neoformat_enabled_javascript = ['prettier-eslint', 'prettier']
let g:neoformat_enabled_json = ['prettier-eslint', 'prettier']
let g:neoformat_enabled_css = ['prettier-eslint', 'prettier']
let g:neoformat_enabled_less = ['prettier-eslint', 'prettier']
let g:auto_save = 1
let g:vim_jsx_pretty_colorful_config = 1 
"call neomake#configure#automake('w')
let g:closetag_filenames = "*.html,*.xhtml,*.jsx,*.js"
let g:ruby_path = system('echo ~/.rbenv/shims')
let fortran_have_tabs=1
let g:jsx_ext_required = 0
let g:python_host_prog = '/usr/bin/python'
let g:mix_format_on_save = 1
let g:python3_host_prog ='/usr/local/bin/python3'
let g:UltiSnipsExpandTrigger="<C-l>"
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
:let g:ruby_indent_block_style = 'do'
:let g:ruby_indent_assignment_style = 'variable'
tnoremap <Esc> <C-\><C-n>

nnoremap <c-p> :FZF<cr>
nmap <buffer> <C-T> <Plug>(xmpfilter-run)
xmap <buffer> <C-T> <Plug>(xmpfilter-run)
imap <buffer> <C-T> <Plug>(xmpfilter-run)

nmap <buffer> <C-c> <Plug>(xmpfilter-mark)
xmap <buffer> <C-c> <Plug>(xmpfilter-mark)
imap <buffer> <C-c> <Plug>(xmpfilter-mark)
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

else
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

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set synmaxcol=128


source ~/.vim/vimrc.before
call clearmatches()
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

endif
let NERDTreeShowHidden=1
set relativenumber
set number
autocmd BufNewFile,BufRead *.slim set ft=slim
set smarttab
set expandtab
set shiftwidth=2
set softtabstop=2

if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

let g:onedark_termcolors=256

syntax on
colorscheme onedark
set guifont=Ubuntu\ Mono\ 15
set backupcopy=yes

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
set tags=tags
