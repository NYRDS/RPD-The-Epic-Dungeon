local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 35, 1, 1, 1, 35, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 11, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 35, 1, 1, 1, 35, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local mob = RPD.MobFactory:mobByName("YogsHeart")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
RPD.permanentBuff(mob, RPD.Buffs.Roots)
end,
locked = function()
return nil
end
}
return customRoom