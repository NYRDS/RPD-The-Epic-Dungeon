local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 1, 1, 1, 4, 4, 4, 19, 1, 1, 1, 19, 4, 4, 4, 1, 1, 1, 4, 4, 4, 19, 1, 1, 1, 19, 4, 4, 4, 1, 1, 1, 4, 4, 4, 19, 1, 1, 1, 19, 4, 4, 4, 1, 1, 1, 4, 4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
object2 = function(cell)
end,
locked = function()
return nil
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 19 then
mob = RPD.MobFactory:mobByName("FireGuard")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
end
end
end
end
}
return customRoom