vim.lsp.config['clangd'] = {
    cmd = {"clangd-12"},
    filetypes = { 'c', 'c.doxygen', 'cpp', 'cpp.doxygen', 'objc', 'objcpp', 'cuda' },
     root_markers = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac', -- AutoTools
    '.git',
  },
}

vim.lsp.enable('clangd');
