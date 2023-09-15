---@type NvPluginSpec
local spec = {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    config = function()
      require("lsp_lines").setup()
        vim.keymap.set(
        "",
        "<leader>l",
        require("lsp_lines").toggle,
        { desc = "Toggle lsp_lines" }
      )
    end,
  },
}

return spec
