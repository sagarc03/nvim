let NERDTreeIgnore=['\.git', 'node_modules', '__pycache__', '.venv', '\.pyc$']
let NERDTreeShowHidden=1
let NERDTreeWinSize=35
let NERDTreeStatusline="%{exists('b:NERDTree')?fnamemodify(b:NERDTree.root.path.str(), ':~'):''}"

nnoremap <silent> <leader>nn :NERDTreeToggle<CR>
