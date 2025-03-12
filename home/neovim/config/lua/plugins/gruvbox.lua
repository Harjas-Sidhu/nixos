return {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000,
    config = function()
    -- +--------------------------------------+
    -- |             Integrations             |
    -- +--------------------------------------+
    -- ----------------------------------------
        require("gruvbox").setup({
            inverse = true;
        })
    -- ----------------------------------------
    end
}
