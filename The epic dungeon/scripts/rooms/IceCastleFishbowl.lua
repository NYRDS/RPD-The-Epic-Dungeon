local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 63, 63, 63, 63, 63, 63, 63, 4, 4, 63, 14, 14, 14, 14, 14, 63, 4, 4, 63, 14, 14, 14, 14, 14, 63, 4, 4, 63, 14, 14, 13, 14, 14, 63, 4, 4, 63, 14, 14, 14, 14, 14, 63, 4, 4, 63, 14, 14, 14, 14, 14, 63, 4, 4, 63, 63, 63, 63, 63, 63, 63, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)
local level = RPD.Dungeon.level
local W = level:getWidth()
local mob = RPD.MobFactory:mobByName("Piranha")
local level = RPD.Dungeon.level
mob:setPos(cell-3)
level:spawnMob(mob);
local mob = RPD.MobFactory:mobByName("Piranha")
local level = RPD.Dungeon.level
mob:setPos(cell+3)
level:spawnMob(mob)

end,
locked = function()
return nil
end
}
return customRoom