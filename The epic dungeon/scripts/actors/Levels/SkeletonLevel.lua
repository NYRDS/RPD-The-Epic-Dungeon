--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local actor = require "scripts/lib/actor"

local Ginerator = require "scripts/lib/Ginerator"

local storage = require "scripts/lib/storage"

return actor.init({
    activate = function()
if RPD.Dungeon.depth == 26 then
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,"Кто прочитал, тот гей")
       RPD.GameScene:show(wnd)
    end
for i = 0,RPD.Dungeon.level:getLength()-1 do            
    if RPD.Dungeon.level.map[i] == RPD.Terrain.STATUE then
RPD.Sfx.CellEmitter:get(i-1):start(RPD.Sfx.ElmoParticle.FACTORY, 0.2);
if math.random(1,10) == 5 then
local mob = RPD.MobFactory:mobByName("Skeleton")            mob:setPos(i-1)
RPD.Dungeon.level:spawnMob(mob)     end
end
end
return true
end,
    actionTime = function()
        return 1
    end,
act = function()
return true
end
})
