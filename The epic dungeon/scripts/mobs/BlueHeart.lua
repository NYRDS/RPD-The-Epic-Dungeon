--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init{
    stats = function(self)
                RPD.permanentBuff(self, RPD.Buffs.Roots)
end,
    damage = function(self, cause)
        local level = RPD.Dungeon.level
        print(self, cause)

        for i = 1,2 do
            local mob = RPD.MobFactory:mobByName("Larva")
            local pos = level:getEmptyCellNextTo(self:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
                level:spawnMob(mob)
            end
        end
    end,
    zapProc = function(self, enemy, dmg)
RPD.topEffect(enemy:getPos(),"Skill")
    return dmg
    end
}
