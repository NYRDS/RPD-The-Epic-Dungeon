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

return mob.init{
spawn = function(self)
RPD.permanentBuff(self, RPD.Buffs.Roots)
end,
damage = function(self, level)
RPD.placeBlob(RPD.Blobs.ToxicGas, self:getPos(), 50);
end,
die = function(self)
local level = RPD.Dungeon.level
local x = level:cellX(self:getPos())
local y = level:cellY(self:getPos())
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
local mob = RPD.Actor:findChar(pos)  
if mob ~= RPD.Dungeon.hero then
if mob and mob:getMobClassName() == "RotLasher" then
mob:damage(100,self)
end
end
end
end
end
}
