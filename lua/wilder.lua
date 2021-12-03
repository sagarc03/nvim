vim.cmd([[call wilder#setup({'modes': [':', '/', '?']})]])
vim.cmd([[call wilder#set_option('renderer', wilder#wildmenu_renderer({'highlighter': wilder#basic_highlighter()}))]])
vim.cmd([[
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'language': 'python',
      \       'fuzzy': 1,
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': wilder#python_fuzzy_pattern(),
      \       'sorter': wilder#python_difflib_sorter(),
      \       'engine': 're',
      \     }),
      \   ),
      \ ])
]])
