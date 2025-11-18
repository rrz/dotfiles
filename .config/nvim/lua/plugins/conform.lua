return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      puppet = { "puppet-lint" },
    },
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
