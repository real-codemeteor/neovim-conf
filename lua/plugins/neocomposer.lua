return {
    "ecthelionvi/NeoComposer.nvim",
    dependencies = { "kkharji/sqlite.lua" },
    opts = {},
    config = function()
        local config = {
            notify = true,
            delay_timer = 150,
            queue_most_recent = false,
            window = {
                width = 60,
                height = 10,
                border = "rounded",
                winhl = {
                    Normal = "ComposerNormal",
                },
            },
            colors = {
                bg = "#16161e",
                fg = "#ff9e64",
                red = "#ec5f67",
                blue = "#5fb3b3",
                green = "#99c794",
            },
        }
        require("NeoComposer").setup(config)
        require("telescope").load_extension("macros")
    end,
}
