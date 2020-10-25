--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

local EPD = require "scripts/lib/dopClasses"



return mob.init{
zapProc = function(self,enemy,dmg, cause)
EPD.Klak(enemy:getPos(),4,15,self,10,math.random(1,5),false)
return nil
end,
stats = function(self)
RPD.permanentBuff(self, RPD.Buffs.Roots)
end,
die = function(self, enemy, dmg)
RPD.topEffect(self:getPos(),"CouldExplotion")
end
}
