-- This is demo buff for charAct

local RPD  = require "scripts/lib/commonClasses"

local buff = require "scripts/lib/buff"

return buff.init{
    desc  = function ()
        return {
            icon          = -1,
            name          = "CounterBuff_Nabuff.target",
            info          = "CounterBuff_Info",
        }
    end,

    attachTo = function(self, buff, target)
        return true
    end,

    charAct = function(self,buff)
buff.target:beckon(RPD.Dungeon.hero:getPos())
for i = 1, RPD.Dungeon.level:getLength()-1 do
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and not maybeMob:isPet() then
if buff.target:canAttack(maybeMob) then
if RPD.Dungeon.level:distance(buff.target:getPos(),i) == 1 then
--maybeMob:damage(10*RPD.Dungeon.depth/2,buff.target)
buff.target:getSprite():attack(maybeMob:getPos())
buff.target:spend(buff.target:speed())
buff.target:attack(maybeMob)
break
else
--maybeMob:damage(buff.target:damageRoll(),buff.target)
buff.target:getSprite():zap(maybeMob:getPos())
buff.target:spend(buff.target:speed())
buff.target:attack(maybeMob)
buff.target:zap(maybeMob)
break
end
end
end
end
--RPD.glog(tostring(buff.target:defenceRoll(buff.target)))
--RPD.glog(tostring(buff.target:attackSkill()))

--buff.target:spend(1)
end
}
