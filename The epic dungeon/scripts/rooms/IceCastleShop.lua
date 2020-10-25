local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 12, 0, 0, 12, 0, 0, 12, 4, 4, 0, 24, 24, 3, 41, 41, 0, 4, 4, 0, 24, 24, 24, 24, 41, 0, 4, 4, 12, 24, 24, 24, 24, 41, 12, 4, 4, 0, 24, 24, 24, 24, 41, 0, 4, 4, 0, 24, 24, 24, 24, 24, 0, 4, 4, 12, 0, 0, 12, 0, 0, 12, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
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

local candle =
{
    kind="Deco",
    object_desc="IceLight"
}
RPD.createLevelObject(candle,cell+W+1)

local mob = RPD.MobFactory:mobByName("Shopkeeper")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end,
locked = function()
return nil
end
}
return customRoom