local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 4, 14, 14, 14, 14, 14, 4, 0, 0, 4, 14, 15, 15, 15, 14, 4, 0, 0, 4, 14, 15, 15, 15, 14, 4, 0, 0, 4, 14, 15, 15, 15, 14, 4, 0, 0, 4, 14, 14, 14, 14, 14, 4, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()


end,
locked = function()
return nil
end
}
return customRoom