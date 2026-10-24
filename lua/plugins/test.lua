-- go, jest and python adapters come from the community packs
---@type LazySpec
return {
  "nvim-neotest/neotest",
  dependencies = { "marilari88/neotest-vitest" },
  opts = function(_, opts)
    opts.adapters = opts.adapters or {}
    table.insert(opts.adapters, require "neotest-vitest" {})
  end,
}
