--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init{
damage = function(self, enemy, dmg)
self:getSprite():emitter():pour( RPD.Sfx.ShadowParticle.UP, 0.8 )
end,
spawn = function(self, enemy, dmg) 
--RPD.affectBuff(self, "FireBless" , 10)
end,
zapProc = function(self, enemy, dmg)
local from = self:getPos()
local to = enemy:getPos()
local mob = RPD.MobFactory:mobByName("effects/Boll") 
mob:setPos(from)
RPD.Dungeon.level:spawnMob(mob)
RPD.permanentBuff(mob,RPD.Buffs.Light)
local factor = RPD.Dungeon.level:distance(from,to)
RPD.Tweeners.JumpTweener:attachTo(mob:getSprite(),to, factor *7,factor * 0.1f)
mob:getSprite():emitter():start(RPD.Sfx.ElmoParticle.FACTORY, 0.01,factor*10+1)
mob:destroy()
end
}
