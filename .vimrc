if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/kazupon/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/kazupon/.vim/bundles')
  call dein#begin('/Users/kazupon/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/kazupon/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neocomplete')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " call dein#add('molokai')
  call dein#add('joshdick/onedark.vim')
  call dein#add('kaicataldo/material.vim')
  call dein#add('thinca/vim-quickrun')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-surround')
  call dein#add('kana/vim-smartinput')
  call dein#add('posva/vim-vue')
  call dein#add('rhysd/github-complete.vim')
  " TODO: pick up from the belows:
  " call dein#add('open-browser.vim')
  " NeoBundle 'jade.vim'
  " NeoBundle 'JSON.vim'
  " NeoBundle 'groenewege/vim-less'
  " NeoBundle 'wavded/vim-stylus'
  " NeoBundle 'taglist.vim'
  " NeoBundle 'scrooloose/syntastic'
  " NeoBundle 'scrooloose/nerdtree'
  " NeoBundle 'tpope/vim-rails'
  " NeoBundle 'ekalinin/Dockerfile.vim'
  " NeoBundle 'deris/vim-kobito'
  " NeoBundle 'nono/vim-handlebars'
  " NeoBundle 'briancollins/vim-jst'
  " NeoBundle 'godlygeek/tabular'
  " NeoBundle 'othree/yajs.vim'

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


" Required:
filetype plugin indent on
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

" ejs
au BufNewFile,BufRead *.ejs set filetype=html

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

" vue
"au BufRead,BufNewFile *.vue set filetype=html
au Filetype vue set tabstop=2
au FileType vue set shiftwidth=2

" go
au BufWritePre *.go Fmt
au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4
au FileType go compiler go

" -----------------------------------------------------------------------------
" Plugin options
" -----------------------------------------------------------------------------

" joshdick/onedark
" colorscheme onedark
" let g:onedark_termcolors=256

" kaicataldo/material.vim
set background=dark
colorscheme material
"let g:material_theme_style = 'default' | 'palenight' | 'dark'
let g:material_theme_style = 'palenight'

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" thinca/quickrun
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


" vim-airline
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme = 'material'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
"let g:airline_left_sep = '▶'
"let g:airline_left_sep = '»'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.branch = '⎇'
let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" vim-fugitive'
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

"
" Shougo/neocomplete
"
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1
" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"
" Shougo/neosnippet.vim
"
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" rhysd/github-complete.vim
let g:github_complete_emoji_japanese_workaround = 1
autocmd FileType markdown,md setlocal omnifunc=github_complete#complete


"
" " vim-syntatic
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_save = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_loc_list_height = 6
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_javascript_checker = 'eslint'
" let g:syntastic_mode_map = {
"       \ 'mode': 'active',
"       \ 'active_filetypes': ['ruby', 'javascript'],
"       \ 'passive_filetypes': []
"       \ }
" "let g:syntastic_enable_signs=1
" "let g:syntastic_error_symbol='✗'
" "let g:syntastic_warning_symbol='⚠'
" nnoremap ,sc :<C-u>SyntasticCheck<CR>
"
