" J and K now move visual lines instead of logical ones
nmap j gj
nmap k gk

" j followed by k will cause an exit of insert mode
imap jk <Esc>

" Don't have to use colon anymore for executing commands
map ; :

set tabstop=4

" Set yank to system clipboard
set clipboard=unnamed
