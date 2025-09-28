--- @class aivanoved.typedef.SetKeymap
--- @field mode string | string[]
--- @field lhs string
--- @field rhs string | fun()
--- @field opts? vim.keymap.set.Opts

local M = {}

--- @class SetKeyMaps: aivanoved.typedef.SetKeymap[]
local SetKeyMaps = {}
SetKeyMaps.__index = SetKeyMaps

--- @return SetKeyMaps
function SetKeyMaps.new()
    return setmetatable({}, SetKeyMaps)
end

--- @param map aivanoved.typedef.SetKeymap
function SetKeyMaps:append(map)
    table.insert(self, map)
end

function SetKeyMaps:set_keymaps()
    for _, map in ipairs(self) do
        vim.keymap.set(map.mode, map.lhs, map.rhs, map.opts)
    end
end

M.SetKeyMaps = SetKeyMaps

return M
