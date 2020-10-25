local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1,1,1,
1,11,1,
1,1,1
}
end,
getHidth = function()
return 3
end,
getWidth = function()
return 3
end,
locked = function()
return nil
end,
objects = function(cell)
local items = {
"ScrollOfUpgrade",
"PotionOfHealing",
"PotionOfStrength"
}
itemm = items[math.random(1,#items)]
if itemm == "PotionOfHealing" then
for i = 1, math.random(3,8) do
local item = RPD.item(itemm)
RPD.Dungeon.level:drop(item,cell)
end
else
local item = RPD.item(itemm)
RPD.Dungeon.level:drop(item,cell)
end

local candle =
{
    kind="Deco",
    object_desc="candle"
}
RPD.createLevelObject(candle, cell-1)
RPD.createLevelObject(candle, cell+1)
end
}
return customRoom