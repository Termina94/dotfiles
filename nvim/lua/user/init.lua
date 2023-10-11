return {
  colorscheme = "astrodark",
  diagnostics = {
    virtual_text = false,
    underline = true,
  },
  mappings = {
    n = {
      U = { "<C-r>", desc = "Redo" },
    },
  },
  lsp = {
    servers = {
      "rust-analyzer",
    },
    config = {
      ["rust-analyzer"] = function()
        return {
          cmd = {"rust-analyzer"};
          filetypes = {"rust"};
          root_dir = require("lspconfig.util").root_pattern("Cargo.toml");
        }
      end,
    },
  },
}

