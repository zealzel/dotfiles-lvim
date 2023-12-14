-- ref: https://www.lunarvim.org/docs/configuration/language-features/language-servers


-- ref:
-- The complete guide to iOS & macOS development in Neovim
-- https://wojciechkulik.pl/ios/the-complete-guide-to-ios-macos-development-in-neovim
--
-- sourcekit nevoim integration
-- https://github.com/apple/sourcekit-lsp/tree/main/Editors
--
-- xcode-build-server
-- https://github.com/SolaWing/xcode-build-server
--

require 'lspconfig'.sourcekit.setup {
  cmd = { "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp" },
}

-- ref:
-- https://moroz.dev/blog/learning-ios-and-swift-day-nine
-- https://www.lunarvim.org/zh-Hans/docs/configuration/autocommands
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "<buffer>",
--   command = "silent! !swiftformat %",
-- })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    --enable omnifunc completion
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- buffer local mappings
    local opts = { buffer = ev.buf }
    -- go to definition
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    --puts doc header info into a float page
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

    -- workspace management. Necessary for multi-module projects
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    -- add LSP code actions
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)

    -- find references of a type
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  end,
})
