if has('gui_macvim')
    set transparency=10 " Set Transparency 
    set antialias
    "set guioptions-=T " None Toolbar
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    "set guifont=Osaka-Mono:h14
    colorscheme koehler 
    set fuoptions=maxvert,maxhorz
    autocmd GUIEnter * set fullscreen
    "set imedisableactivate " Set IME
    "set imdisable
    set migemo
    set clipboard=unnamed
    set guioptions+=a

    "let g:save_window_file = expand('~/.vimwinpos')
    "augroup SaveWindow
    "    autocmd!
    "    autocmd VimLeavePre * call s:save_window()
    "    function! s:save_window()
    "        let options = [
    "            \ 'set columns=' . &columns,
    "            \ 'set lines=' . &lines,
    "            \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
    "            \ ]
    "        call writefile(options, g:save_window_file)
    "    endfunction
    "augroup END

    "if filereadable(g:save_window_file)
    "    execute 'source' g:save_window_file
    "endif
endif


"------------------------------------------------------------------------------
" other custom setting

set tags=tags " use taglist.vim
let tlist_objc_settings='objc;P:protocols;i:interfaces;I:implementations;M:instance methods;C:implementation methods;Z:protocol methods'

augroup MyObjcAutoCmd
    autocmd!
    autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen
    autocmd QuickfixCmdPost l* lopen

    autocmd FileType objc nnoremap <buffer> <d-9> :call XcodeBuildCheck()<CR>
    autocmd FileType objc inoremap <buffer> <d-9> <C-o>:call XcodeBuildCheck()<CR>
    autocmd FileType objc setlocal makeprg=xcodebuild\ -activetarget\ -activeconfiguration\ \\\|\ grep\ -e\ '^/.*'\ \\\|\ sort\ -u

    function! XcodeBuildCheck() 
        let proj_dir = substitute(b:cocoa_proj, '(.*)/.*' , '1', '')
        let current_dir = getcwd()
        execute ":lcd " . escape(expand(proj_dir), " #\\")
        make
        execute ":lcd " . escape(expand(current_dir), " #\\")
    endfunction

augroup END
