" start of the vundle magic !!
filetype off 

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" syntax
Bundle 'nginx.vim'
Bundle 'jade.vim'
Bundle 'JSON.vim'
Bundle 'groenewege/vim-less'
Bundle 'vim-coffee-script'
Bundle 'Arduino-syntax-file'

" color scheme
Bundle 'guicolorscheme.vim'
Bundle 'Solarized'
Bundle 'molokai'
Bundle 'rdark'

" utility
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'thinca/vim-quickrun'
Bundle 'open-browser.vim'
Bundle 'neocomplcache'
Bundle 'surround.vim'
Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'buftabs'
Bundle 'Lokaltog/vim-powerline'
Bundle 'taglist.vim'
"Bundle 'tclem/vim-arduino'
Bundle 'peplin/vim-arduino'

filetype plugin indent on
" end of the vundle magic !!


syntax enable

" setting edit options
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set autoindent
set backspace=2
set wrapscan
set showmatch
set wildmenu
set formatoptions+=mM
let format_allow_over_tw=1
set clipboard+=autoselect
"set history=50
"set list


" setting serach options
set ignorecase
" set noigonorecase
set hlsearch
" set nohlsearch
set smartcase
" set nosmartcase
" set incsearch
" set noincsearch


" setting view options
set number
set nolist
set wrap
set laststatus=2
set ruler
set cmdheight=2
set showcmd
set title
set t_Co=256
"colorschem koehler
"GuiColorScheme desert256
" solarized
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
" molokai
colorscheme molokai
let g:molokai_original=1
" rdark
"colorscheme rdark
"let rdark_current_line=1


" cursor settings
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black
set cursorline


" Folding settings
set foldmethod=indent " method expand.
set foldlevel=1 " method expand level.


" filetype settings

" all
set encoding=utf-8

" java
"autocmd FileType java set makeprg=vimAnt
"autocmd FileType java set efm=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,\%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
"autocmd FileType java :set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
":let java_highlight_all=1
:let java_highlight_functions=1
":let java_highlight_debug=1
autocmd Filetype java set tags+=~/.tags/java6
autocmd FileType java set tags+=~/.tags/android
"function! CompileJava()
"    :make 
"    :cw
"endfunction
"autocmd FileType java nmap <F5> :call CompileJava()<CR>

" c++
autocmd FileType cpp set tabstop=2
autocmd FileType cpp set shiftwidth=2

" python
autocmd FileType python set tabstop=2
autocmd FileType python set shiftwidth=2

" ruby
autocmd FileType ruby set tabstop=2
autocmd FileType ruby set shiftwidth=2

" javascript
autocmd FileType javascript set tabstop=2
autocmd FileType javascript set shiftwidth=2

" coffeescript
autocmd Filetype coffee set tabstop=2
autocmd FileType coffee set shiftwidth=2

" lua
autocmd FileType lua set tabstop=3
autocmd FileType lua set shiftwidth=3

" html
autocmd FileType html set tabstop=2
autocmd FileType html set shiftwidth=2

" css
autocmd FileType css set tabstop=2
autocmd FileType css set shiftwidth=2

" less
autocmd FileType less set tabstop=2
autocmd FileType less set shiftwidth=2

" arduino
au BufNewFile,BufRead *.pde set filetype=arduino
au BufNewFile,BufRead *.ino set filetype=arduino
autocmd Filetype arduino set tabstop=2
autocmd FileType arduino set shiftwidth=2

" processing
autocmd Filetype pde set tabstop=2
autocmd FileType pde set shiftwidth=2

" json
au BufRead,BufNewFile *.json set filetype=json
autocmd Filetype json set tabstop=2
autocmd FileType json set shiftwidth=2

" markdown
aut BufRead, BufNewFile *.md set filetype=markdown

" nginx 
au BufRead,BufNewFile /opt/local/etc/nginx/services/* set ft=nginx 
au BufRead,BufNewFile /opt/local/etc/nginx/*.conf set ft=nginx 


" quickrun
let g:quickrun_config = {}
let g:quickrun_config.javascript = { 'command': 'node' }
let g:quickrun_config.markdown = {
    \ 'type': 'markdown/pandoc',
    \ 'outputter': 'browser',
    \ 'cmdopt': '-s'
    \ }
let g:quickrun_config.lua = { 'command': 'lua' }


" neocomplcache settings

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 5 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
    
" define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" snippet 
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
let g:neocomplcache_snippets_dir = $HOME . '/.vim/snippets'
fun! Filename(...)
    let filename = expand('%:t:r')
    if filename == '' | return a:0 == 2 ? a:2 : '' | endif
    return !a:0 || a:1 == '' ? filename : substitute(a:1, '$1', filename, 'g')
endf

" plugin key-mappings.
"imap <TAB>     <Plug>(neocomplcache_snippets_expand)
"smap <TAB>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" superTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()

" autoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'


" vim-coffee-script settings
let coffee_folding = 1
"let coffee_no_trailing_space_error = 1
"let coffee_no_trailing_semicolon_error = 1
"let coffee_no_reserved_words_error = 1


" vimshell settings
"let g:VimShell_EnableInteractive = 1


" indent-guides
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_color_change_percent=30
let g:indent_guides_guide_size=3
hi IndentGuidesEven ctermbg=lightgrey
hi IndentGuidesOdd ctermbg=black


" buftabs
"let buftabs_only_basename=1
"let buftabs_in_statusline=1


" powerline
set guifont=Monaco-Powerline:h11
set guifontwide=Monaco-Powerline:h11
let g:Powerline_symbols='fancy'


" vim-arduino 
" Usage
" <Leader>ac - Compile the current sketch.
" <Leader>ad - Compile and deploy the current sketch.
" <Leader>as - Open a serial port in screen.
let g:vim_arduino_map_keys=1


" mouse term settings
if has("mouse")
    set mouse=a
endif

