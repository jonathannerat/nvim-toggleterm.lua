local tt = require "toggleterm.terminal"

local M = {}

local function getterm()
  return tt.get(vim.b.toggle_number)
end

local function toggleterm_nr()
  local t = getterm()
  if not t then return end
  return string.format("Term #%d", t.id)
end

local function toggelterm_name()
  local t = getterm()
  if not t then return end
  local cmd = string.match(t.name, ".*/(%w+)")
  local dir = string.gsub(t.dir, vim.env.HOME, "~")
  return string.format("%s: %s", dir, cmd)
end

M.sections = {
  lualine_a = {toggleterm_nr},
  lualine_c = {toggelterm_name},
}

M.filetypes = {"toggleterm"}

return M
