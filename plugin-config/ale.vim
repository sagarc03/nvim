let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
 \ 'javascript': [ 'eslint'],
  \ 'html': ['prettier'],
  \ 'css': ['prettier'],
 \ }
