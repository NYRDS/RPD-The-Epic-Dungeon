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
if RPD.Dungeon.depth ~= 10 then
Ginerator.CreateLevel("RatLevel")
end
if not storage.get("Deco") then
storage.put("Deco")
RPD.Dungeon.level:set(RPD.Dungeon.hero:getPos(),RPD.Terrain.ENTRANCE)
end
for i = 1,RPD.Dungeon.level:getLength()-2 do           
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() ==  "Shopkeeper" then
RPD.topEffect(i,"RatKeeper")
maybeMob:getSprite():killAndErase()
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
