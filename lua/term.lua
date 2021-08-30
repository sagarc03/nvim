require("toggleterm").setup {
    -- size can be a number or function which is passed the current terminal
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = "1", -- "<number>", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = true,
    direction = "horizontal", -- "vertical" | "horizontal" | "window" | "float",
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell -- change the default shell
}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit =
    Terminal:new(
    {
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
            border = "double"
        },
        close_on_exit = true, -- close the terminal window when the process exits
        -- function to run on opening the terminal
        on_open = function(term)
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        end
    }
)

function LazyGitToggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua LazyGitToggle()<CR>", {noremap = true, silent = true})