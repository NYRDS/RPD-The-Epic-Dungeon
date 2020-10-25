--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"


return mob.init{
    zapProc = function(self, cause) local level = RPD.Dungeon.level

    if self:isPet() then
        for i = 1,2 do
            local mob = RPD.MobFactory:mobByName("Bee")
            local pos = level:getEmptyCellNextTo(self:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero))
 RPD.Sfx.Wound:hit(mob)
RPD.Sfx.SpellSprite:show(self, RPD.Sfx.SpellSprite.SUMMON)
              end
        end
else
        for i = 1,2 do
            local mob = RPD.MobFactory:mobByName("Bee")
            local pos = level:getEmptyCellNextTo(self:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
level:spawnMob(mob)
 RPD.Sfx.Wound:hit(mob)
RPD.Sfx.SpellSprite:show(self, RPD.Sfx.SpellSprite.SUMMON)
              end
        end
end
    end,
      move = function(self, cell)
self:getSprite():emitter():start(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.EVOKE ), 0.01,5);

local dst = RPD.Ballistica:cast(self:getPos(), cell, true, true, true)
RPD.blinkTo(self,dst)
--self:getSprite():move(self:getPos(),dst)
        end
}
