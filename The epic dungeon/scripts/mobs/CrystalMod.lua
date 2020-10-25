--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

local Wands = {
"BlackWand",
"BlessWand",
"NefritWand",
"SummonerWand",
"WandOfBlast",
"WandOfCrystalion",
"WandOfFireRune",
"WandOfGoodMage",
"WandOfLightbolt",
"WandOfMagicbolt",
"WandOfMirror",
"WandOfPossess",
"WandOfRock"
}
return mob.init{
stats = function(self)
a = storage.get("Wand") or math.random(1,13)
storage.put("Wand",a)

self:ht(RPD.Dungeon.depth*2)
self:hp(self:ht())
self:dr(RPD.Dungeon.depth-2)
RPD.permanentBuff(self, RPD.Buffs.Roots)
if RPD.Dungeon.depth ~= 0 then
s = RPD.Dungeon.depth/2
else
s = 0
end
end,
attackProc = function(self,enemy,dmg)
if RPD.Dungeon.depth ~= 0 then
EPD.mobWandUser(Wands[a], self, enemy:getPos(),RPD.Dungeon.depth/2)
else
EPD.mobWandUser(Wands[a], self, enemy:getPos(),0)
end
end,
zapProc = function(self,enemy,dmg)
if RPD.Dungeon.depth ~= 0 then
EPD.mobWandUser(Wands[a], self, enemy:getPos(),RPD.Dungeon.depth/2)
else
EPD.mobWandUser(Wands[a], self, enemy:getPos(),0)
end
end,
damage = function(me, level)
RPD.playSound( "CrystalGaurd.ogg" )
end,
die = function(self)
local book = RPD.creteItem(("Wands/"..Wands[a]) ,{level=s})
RPD.Dungeon.level:drop(book, self:getPos())
end
}
