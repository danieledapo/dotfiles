return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "black",
      "ruff-lsp",
      "rust-analyzer",
      "shellcheck",
      "shfmt",
      "stylua",
      "typescript-language-server",
    },
  },
}
