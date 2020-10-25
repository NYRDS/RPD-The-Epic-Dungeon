local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 4, 1, 1, 1, 1, 1, 4, 0, 0, 4, 1, 1, 1, 1, 1, 4, 0, 0, 4, 1, 1, 14, 1, 1, 4, 0, 0, 4, 1, 1, 1, 1, 1, 4, 0, 0, 4, 1, 1, 1, 1, 1, 4, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)
local mob = RPD.MobFactory:mobByName("MagicShadowSpider")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
local w = level:getWidth()
local candle =
{
    kind="Deco",
    object_desc="SpiderTile1"
}
RPD.createLevelObject(candle,cell-w*2-2)
RPD.createLevelObject(candle,cell-w*2+2)
RPD.createLevelObject(candle,cell+w*2-2)
RPD.createLevelObject(candle,cell+w*2+2)

end,
locked = function()
return nil
end
}
return customRoom