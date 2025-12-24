require('aivanoved.set')
require('aivanoved.remap')

require('aivanoved.lazy_init')

local PLUGINS = require('aivanoved.plugins')

for _, plugin in ipairs(PLUGINS) do
    plugin.setup()
end
