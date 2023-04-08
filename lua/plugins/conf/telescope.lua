return function(config, opts) 
  local telescope = require("telescope")
  
  telescope.setup(opts)

  telescope.load_extension("fzf")
  telescope.load_extension("notify")

end 
