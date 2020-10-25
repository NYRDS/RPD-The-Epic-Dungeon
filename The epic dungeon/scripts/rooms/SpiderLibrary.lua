local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
9, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41, 41, 41, 41, 41, 0, 0, 0, 0, 41, 14, 14, 14, 41, 0, 0, 0, 0, 41, 14, 14, 14, 41, 0, 0, 0, 0, 41, 14, 14, 14, 41, 0, 0, 0, 0, 41, 41, 41, 41, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 9
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
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP then
if math.random(1,8) == 1 then
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.SCROLL,4 )
RPD.Dungeon.level:drop(item,pos-1)
end
end
end
end
local w = level:getWidth()
local candle =
{
    kind="Deco",
    object_desc="SpiderTile1"
}
RPD.createLevelObject(candle,cell-w*4-4)
RPD.createLevelObject(candle,cell-w*4+4)
RPD.createLevelObject(candle,cell+w*4-4)
RPD.createLevelObject(candle,cell+w*4+4)

end,
locked = function()
return nil
end
}
return customRoom