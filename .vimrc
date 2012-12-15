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
Bundle 'nanotech/jellybeans.vim'
Bundle 'moria'
Bundle 'wombat'
Bundle 'darkspectrum'
Bundle 'robokai'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'desert'

" utility
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'thinca/vim-quickrun'
Bundle 'open-browser.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'surround.vim'
Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'buftabs'
Bundle 'Lokaltog/vim-powerline'
Bundle 'taglist.vim'
"Bundle 'tclem/vim-arduino'
Bundle 'peplin/vim-arduino'
Bundle 'wavded/vim-stylus'
Bundle 'kana/vim-smartinput'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'

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
"jellybeans"
"colorscheme jellybeans
"moria
"let moria_style = 'white'
"let moria_style='black' 
"colorscheme moria
"let moria_monochrome=1
"Wombat
"colorscheme wombat
"darkspectrum
"colorscheme darkspectrum
"robokai
"colorscheme robokai
"tomorrow-theme (tomorrow, tomorrow-night, tomorrow-night-bright, tomorrow-night-blue, tomorrow-night-eighties)
"colorscheme tomorrow-night-bright


" cursor settings
augroup cch
    au! cch
    au WinLeave * set nocursorline
    au WinEnter,BufRead * set cursorline
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
"au FileType java set makeprg=vimAnt
"au FileType java set efm=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,\%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
"au FileType java :set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
":let java_highlight_all=1
:let java_highlight_functions=1
":let java_highlight_debug=1
au Filetype java set tags+=~/.tags/java6
au FileType java set tags+=~/.tags/android
"function! CompileJava()
"    :make 
"    :cw
"endfunction
"au FileType java nmap <F5> :call CompileJava()<CR>

" c
au FileType c set tabstop=2
au FileType c set shiftwidth=2

" c++
au FileType cpp set tabstop=2
au FileType cpp set shiftwidth=2

" python
au FileType python set tabstop=2
au FileType python set shiftwidth=2

" ruby
au FileType ruby set tabstop=2
au FileType ruby set shiftwidth=2

" javascript
au FileType javascript set tabstop=2
au FileType javascript set shiftwidth=2

" coffeescript
au Filetype coffee set tabstop=2
au FileType coffee set shiftwidth=2

" lua
au FileType lua set tabstop=2
au FileType lua set shiftwidth=2

" html
au FileType html set tabstop=2
au FileType html set shiftwidth=2

" css
au FileType css set tabstop=2
au FileType css set shiftwidth=2

" less
au FileType less set tabstop=2
au FileType less set shiftwidth=2

" arduino
au BufNewFile,BufRead *.pde set filetype=arduino
au BufNewFile,BufRead *.ino set filetype=arduino
au Filetype arduino set tabstop=2
au FileType arduino set shiftwidth=2

" processing
au Filetype pde set tabstop=2
au FileType pde set shiftwidth=2

" json
au BufRead,BufNewFile *.json set filetype=json
au Filetype json set tabstop=2
au FileType json set shiftwidth=2

" markdown
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.mkd set filetype=markdown

" nginx 
au BufRead,BufNewFile /opt/local/etc/nginx/services/* set ft=nginx 
au BufRead,BufNewFile /opt/local/etc/nginx/*.conf set ft=nginx 

" stylus
au BufRead,BufNewFile *.stylus set filetype=styl
au Filetype stylus set tabstop=2
au FileType stylus set shiftwidth=2

" binary editting
" vim -b : edit binary using xxd-format!
augroup Binary
    au!
    au BufReadPre  *.bin let &binary =1
    au BufReadPost * if &binary | silent %!xxd -g 1
    au BufReadPost * set ft=xxd | endif
    au BufWritePre * if &binary | %!xxd -r | endif
    au BufWritePost * if &binary | silent %!xxd -g 1
    au BufWritePost * set nomod | endif
augroup END

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
    
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#close_popup() . "\<CR>"
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" neocomplcache complete snippets settings

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)

" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Snippets template dictionaries
let g:neocomplcache_snippets_dir = $HOME . '/.vim/snippets'
fun! Filename(...)
    let filename = expand('%:t:r')
    if filename == '' | return a:0 == 2 ? a:2 : '' | endif
    return !a:0 || a:1 == '' ? filename : substitute(a:1, '$1', filename, 'g')
endf

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


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
let g:Powerline_colorscheme='skwp'


" vim-arduino 
" Usage
" <Leader>ac - Compile the current sketch.
" <Leader>ad - Compile and deploy the current sketch.
" <Leader>as - Open a serial port in screen.
let g:vim_arduino_map_keys=1


" vim-syntatic
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_save = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 6
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checker = 'jshint'
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': ['ruby', 'javascript'],
      \ 'passive_filetypes': []
      \ }
"let g:syntastic_enable_signs=1
"let g:syntastic_error_symbol='✗'
"let g:syntastic_warning_symbol='⚠'
nnoremap ,sc :<C-u>SyntasticCheck<CR>


"vim-fugitive'
nnoremap gst :<C-u>Gstatus<CR>
nnoremap gwr :<C-u>Gwrite<CR>
nnoremap gre :<C-u>Gread<CR>
nnoremap gcm :<C-u>Gcommit<CR>
nnoremap gdf :<C-u>Gdiff<CR>
nnoremap gbl :<C-u>Gblame<CR>


" mouse term settings
if has("mouse")
    set mouse=a
endif

