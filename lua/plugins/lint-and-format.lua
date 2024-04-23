return {
    {
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
    },
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local conform = require "conform"

            conform.setup {
                formatters_by_ft = {
                    javascript = { "prettierd" },
                    typescript = { "prettierd" },
                    javascriptreact = { "prettierd" },
                    typescriptreact = { "prettierd" },
                    svelte = { "prettierd" },
                    css = { "prettierd" },
                    html = { "prettierd" },
                    json = { "prettierd" },
                    yaml = { "prettierd" },
                    markdown = { "prettierd" },
                    graphql = { "prettierd" },
                    liquid = { "prettierd" },
                    lua = { "stylua" },
                    python = { "isort", "black" },
                },
                format_on_save = {
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 1000,
                },
            }

            local function format_on_save()
                conform.format {
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 1000,
                }
            end

            vim.keymap.set(
                { "n", "v" },
                "<leader>fm",
                format_on_save,
                { desc = "Format file or range (in visual mode)" }
            )
        end,
    },
}
