let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:jsx_ext_required = 0
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\ 'python':['flake8', 'mypy', 'pylint'],
\ }
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
 \ 'javascript': ['prettier', 'eslint'],
\ 'python':['black', 'isort'],
 \ }

nnoremap <leader>af :ALEFix<cr>
"Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>
