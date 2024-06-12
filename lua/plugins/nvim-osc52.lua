return {
    "ojroques/nvim-osc52",
    config = function()
        require("osc52").setup({
            max_length = 0,
            silent = false,
            trim = true,
            tmux_passthrough = false,
        })
        local function copy(lines, _)
            require("osc52").copy(table.concat(lines, "\n"))
        end

        local function paste()
            return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
        end

        vim.g.clipboard = {
            name = "osc52",
            copy = { ["+"] = copy, ["*"] = copy },
            paste = { ["+"] = paste, ["*"] = paste },
        }
    end,
}
