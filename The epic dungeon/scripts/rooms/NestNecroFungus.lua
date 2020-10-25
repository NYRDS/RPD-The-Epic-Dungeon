local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1, 4, 4, 4, 1, 1, 9, 1, 1, 4, 4, 1, 9, 9, 9, 1, 4, 4, 1, 1, 9, 1, 1, 4, 4, 4, 1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
locked = function()
return nil
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
local level = RPD.Dungeon.level

local bigFungus =
{
    kind="Deco",
    object_desc="NestTile6"
}
local smallFungus = 
{
    kind="Deco",
    object_desc="NestTile5"
}

RPD.createLevelObject(bigFungus,cell)
RPD.createLevelObject(smallFungus,cell-1)
RPD.createLevelObject(smallFungus,cell+1)
RPD.createLevelObject(smallFungus,cell-W)
RPD.createLevelObject(smallFungus,cell+W)

local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY then
if math.random(1,12) == 1 then
local mob = RPD.MobFactory:mobByName("NecroSpider")
mob:setPos(pos-1)
level:spawnMob(mob)
elseif math.random(1,12) == 1 then
local mob = RPD.MobFactory:mobByName("NecroSkeletonSpider")
mob:setPos(pos-1)
level:spawnMob(mob)
end
end
end
end
end
}
return customRoom