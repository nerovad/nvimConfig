-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Build and run current C++ file in a split terminal
vim.keymap.set("n", "<F5>", function()
  local file = vim.fn.expand("%:t:r")
  local root = vim.fs.root(0, { "CMakeLists.txt", ".git" })
  if not root then
    vim.notify("No project root found", vim.log.levels.ERROR)
    return
  end
  vim.cmd("!cmake --build " .. root .. "/build")
  vim.cmd("split | terminal " .. root .. "/build/" .. file)
end, { desc = "Build & Run C++ file" })
