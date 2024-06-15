if vim.g.vscode then
-- Autocommand that sets the filetype when saving a new file
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*", -- This pattern could be changed to specific file patterns
    callback = function()
        -- Logic to check if the file is new (doesn't exist on disk yet) and set the desired filetype
        local buf = vim.api.nvim_get_current_buf()
        local filename = vim.api.nvim_buf_get_name(buf)
        if filename == "" then
            -- Assuming you want to set the filetype to 'txt' for new files
            -- Update the logic here if you need to check for specific conditions
            vim.bo[buf].filetype = 'txt'
            -- Additionally, if you want to save the file with a specific extension,
            -- you can construct the filename and use vim.cmd to save it
            -- For example, to save with a .txt extension in the current directory:
            local new_filename = "untitled.txt"
            vim.cmd('saveas ' .. new_filename)
        end
    end
})
end
