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
if RPD.Dungeon.depth ~= 25 then
Ginerator.CreateLevel("GooLevel")
end


for i = 1, RPD.Dungeon.level:getLength()-1 do
if math.random(1,50) == 1 then
if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL then
RPD.Dungeon.level:set(i-1,RPD.Terrain.WALL_DECO)
RPD.GameScene:updateMap(i-1)
end
if RPD.Dungeon.level.water[i] then
RPD.topEffect(i-1,"GooRain")
end
end
end
if not storage.get("Deco") then
storage.put("Deco")
for i = 1, RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == 4 then
if RPD.Dungeon.level.water[i+48] then
local deco =
{
    kind = "Deco",
    object_desc = ("GooTile"..math.random(1,3))
}
RPD.createLevelObject(deco, i-1)
end
end
end
end
for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() ==  "Shopkeeper" then
RPD.topEffect(i,"GooKeeper")
maybeMob:getSprite():killAndErase()
end
end
for i = 0,RPD.Dungeon.level:getLength()-1 do            
RPD.Sfx.CellEmitter:get(i):pour(RPD.Sfx.ShadowParticle.UP, 4);
end
return true
end,
act = function()
  if RPD.Dungeon.level.water[RPD.Dungeon.hero:getPos()+1] then
        RPD.affectBuff(RPD.Dungeon.hero, RPD.Buffs.Slow , 1)
    end
return true
    end,
    actionTime = function()
        return 1
    end
})