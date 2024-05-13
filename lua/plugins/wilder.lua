return {
    "gelguy/wilder.nvim",
    lazy = false,
    config = function()
        local wilder = require "wilder"

        wilder.setup {
            modes = { ":", "/", "?" },
            previous_key = "<C-p>",
        }

        wilder.set_option(
            "renderer",
            wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
                highlights = { border = "Normal" },
                border = "rounded",
            })
        )

        wilder.set_option("pipeline", {
            wilder.branch(wilder.cmdline_pipeline(), wilder.search_pipeline()),
        })
    end,
}
