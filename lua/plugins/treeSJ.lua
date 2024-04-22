return {
    "Wansmer/treesj",
    keys = {},
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("treesj").setup {
            use_default_keymaps = false,
        }
        vim.keymap.set({ "n", "v" }, "<leader>tm", "<CMD> TSJToggle <CR>", { desc = "Toggle node splitting" })
        vim.keymap.set({ "n", "v" }, "<leader>ts", "<CMD> TSJSplit <CR>", { desc = "Split node under cursor" })
        vim.keymap.set({ "n", "v" }, "<leader>tj", "<CMD> TSJJoin <CR>", { desc = "Join node under cursor" })
    end,
}