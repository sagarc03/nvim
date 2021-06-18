" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/schavan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/schavan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/schavan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/schavan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/schavan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  fzf = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  molokai = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/molokai"
  },
  neoformat = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  nerdtree = {
    commands = { "NERDTreeToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/opt/nerdtree"
  },
  ["nerdtree-git-plugin"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/nerdtree-git-plugin"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lint"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/nvim-lint"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspfuzzy"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/nvim-lspfuzzy"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-toggle-terminal"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/nvim-toggle-terminal"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["poet-v"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/opt/poet-v"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight-vim"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/tokyonight-vim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-nerdtree-syntax-highlight"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/vim-nerdtree-syntax-highlight"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/schavan/.local/share/nvim/site/pack/packer/start/vim-surround"
  }
}

time([[Defining packer_plugins]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file NERDTreeToggle lua require("packer.load")({'nerdtree'}, { cmd = "NERDTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType python ++once lua require("packer.load")({'poet-v'}, { ft = "python" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
