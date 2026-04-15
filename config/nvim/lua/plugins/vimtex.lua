-- return {
--   "lervag/vimtex",
--   lazy = false,     -- we don't want to lazy load VimTeX
--   init = function()
--     -- VimTeX configuration goes here, e.g.
--     vim.g.vimtex_view_method = "zathura"
--     vim.g.vimtex_compiler_method = "tectonic"
--   end
-- }
return {
    "lervag/vimtex",
    lazy = false, -- vimtex needs to load early
    init = function()
        vim.g.vimtex_view_method = "zathura" -- or "skim" on macOS, "sumatrapdf" on Windows
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_quickfix_open_on_warning = 0
        vim.g.vimtex_compiler_latexmk = {
            build_dir = "",
            callback = 1,
            continuous = 1, -- recompile on save automatically
            executable = "latexmk",
            options = {
                "-pdf",
                "-shell-escape",
                "-verbose",
                "-file-line-error",
                "-synctex=1",  -- enables forward/inverse search between editor and PDF
            },
        }
    end,
}
