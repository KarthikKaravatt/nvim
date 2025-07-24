---
vim.g.mapleader = " "
vim.g.maplocalleader = " "


vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.tsx", -- Specifies the file pattern for .tsx files
  callback = function()
    local filetype = vim.bo.filetype
    if filetype == "typescriptreact" then
      -- Check if the command exists before trying to execute it
      if vim.fn.exists(":TailwindSort") ~= 0 then
        vim.cmd("TailwindSort")
      else
        print("Warning: :TailwindSort command not found. Make sure tailwind-tools is loaded.")
      end
    end
  end,
  desc = "Run TailwindSort on save for TSX files",
})

local config_dir = vim.fn.stdpath("config") .. "/lua/config/"

local function load_config_files()
  local scan = vim.loop.fs_scandir(config_dir)
  if not scan then
    vim.notify("Error config direcotry not found", 1, nil)
    return
  end

  while true do
    local name, t = vim.loop.fs_scandir_next(scan)
    if not name then
      break
    end

    if t == "file" and name:match("%.lua$") then
      local module = "config." .. name:gsub("%.lua$", "")
      local ok, err = pcall(require, module)

      if not ok then
        vim.notify("Error Loading", 1, nil)
      end
    end
  end
end

load_config_files()
