set nocompatible " Be iMproved

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" my favoraite plugins
NeoBundle 'molokai'
NeoBundle 'surround.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'open-browser.vim'
NeoBundle 'jade.vim'
NeoBundle 'JSON.vim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'taglist.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'tpope/vim-rails'
NeoBundle 'kana/vim-smartinput'

filetype plugin indent on " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck


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
"set colorcolumn=80
set t_Co=256
set encoding=utf-8

" Folding settings
set foldmethod=indent " method expand.
set foldlevel=1 " method expand level.

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

" filetype settings

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


" -----------------------------------------------------------------------------
" Plugin options
" -----------------------------------------------------------------------------

" molokai
colorscheme molokai
let g:molokai_original=1


" quickrun
let g:quickrun_config = {}
let g:quickrun_config.javascript = { 'command': 'node' }
"let g:quickrun_config.markdown = {
"    \ 'type': 'markdown/pandoc',
"    \ 'outputter': 'browser',
"    \ 'cmdopt': '-s'
"    \ }
let g:quickrun_config.markdown = {
    \ 'outputter': 'null',
    \ 'command': 'open',
    \ 'cmdopt': '-a',
    \ 'args': 'Marked',
    \ 'exec': '%c %o %a %s'
    \ }
let g:quickrun_config.lua = { 'command': 'lua' }


" powerline
set guifont=Monaco-Powerline:h11
set guifontwide=Monaco-Powerline:h11
let g:Powerline_symbols='fancy'
"let g:Powerline_colorscheme='skwp'


"vim-fugitive'
nnoremap gst :<C-u>Gstatus<CR>
nnoremap gwr :<C-u>Gwrite<CR>
nnoremap gre :<C-u>Gread<CR>
nnoremap gcm :<C-u>Gcommit<CR>
nnoremap gdf :<C-u>Gdiff<CR>
nnoremap gbl :<C-u>Gblame<CR>


"vim-gitgutter
"let g:gitgutter_enabled = 0
"let g:gitgutter_highlights = 1 
highlight clear SignColumn


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
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

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
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'


" neosnippet

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
xmap <C-l>     <Plug>(neosnippet_start_unite_snippet_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
