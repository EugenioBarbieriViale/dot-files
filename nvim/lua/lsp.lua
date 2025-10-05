local vim = vim

require("mason").setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },

    pip = {
        upgrade_pip = true,
    }
})

require("supermaven-nvim").setup({})

vim.diagnostic.config({
  virtual_text = true,
})

vim.diagnostic.open_float()

vim.lsp.config("lua-language-server", {
    cmd = {"lua-language-server", "--stdio"},
    filetypes = {"lua"},
})

local function on_attach(client, bufnr)
    vim.lsp.completion.enable(true, client.id, bufnr, {
        autotrigger = true,
        convert = function(item)
            return { abbr = item.label:gsub('%b()', '') }
        end,
    })
end

local function start_autocomplete(name, cmd)
    local config = {
        name = name,
        on_attach = on_attach,
    }

    if cmd then
        config.cmd = cmd
    end

    vim.lsp.start(config)
end


vim.lsp.enable("rust_analyzer")
start_autocomplete("rust_analyzer")

vim.lsp.enable("pyright")
start_autocomplete("pyright", { "pyright-langserver", "--stdio" })

vim.lsp.enable("lua-language-server")
start_autocomplete("lua-language-server", { "lua-language-server", "--stdio" })

vim.lsp.enable("clangd")
start_autocomplete("clangd", { "clangd" })

vim.lsp.enable("gopls")
start_autocomplete("gopls", { "gopls" })
