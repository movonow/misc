<pre>

==============================BASH==============================

sudo apt-get install silversearcher-ag
python3 -m pip install --user powerline-status
git clone git://github.com/wting/autojump.git ~/github.com/autojump
(cd  ~/github.com/autojump && ./install.py)

#.bashrc
LBIN=~/.local/bin
LLIB=~/.local/lib
GOBIN=$LBIN/go1.14/bin
export PATH=$LBIN:$GOBIN:$PATH
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. $LLIB/python$(python --version | cut -c 8-10)/site-packages/powerline/bindings/bash/powerline.sh
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh


==============================TMUX==============================

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#.tmux.conf
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

 # prefix + Ctrl-s: save
 # prefix + Ctrl-r: restore
 set -g @plugin 'tmux-plugins/tmux-resurrect'

 # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf) 
 # prefix + shift + i: Installs new plugins from GitHub or any other git repository
 # prefix + shift + u: updates plugin(s)
 # prefix + alt + u: remove/uninstall plugins not on the plugin list
 run -b '~/.tmux/plugins/tpm/tpm'


==============================VIM==============================

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
git clone https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack.vim

# .vimrc
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="left"
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeAutoDeleteBuffer=1
 
 " quickfix
"map <C-n> :cnext<CR>
"map <C-m> :cprevious<CR>
"nnoremap <leader>a :cclose<CR>

" let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
"autocmd FileType go nmap <leader>b <Plug>(go-build)

autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>i <Plug>(go-info)

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

</pre>
