return {
    "nvimtools/none-ls.nvim",
    opts = function()
        local null_ls = require "null-ls"

        local opts = {
            sources = {
                null_ls.builtins.diagnostics.ruff,
                null_ls.builtins.diagnostics.mypy,
                null_ls.builtins.diagnostics.eslint_d,
            },
        }
        return opts
    end,
}