return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
    -- +--------------------------------------+
    -- |             Integrations             |
    -- +--------------------------------------+
    -- ----------------------------------------
        require("catppuccin").setup({
            integrations = {
                treesitter = true,
                telescope = true,
                markdown = true,
            }
        })
    -- ----------------------------------------
    end
}
