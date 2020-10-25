--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

local mob = require"scripts/lib/mob"

return mob.init({
spawn = function(self)
local level = RPD.Dungeon.level
local W = level:getWidth()
cell = math.random(1,level:getLength()-1)
while level.map[cell] ~= RPD.Terrain.EMPTY and cell ~= self:getPos() do
cell = math.random(1,level:getLength()-1)
end
local item = RPD.item("Artifacts/RatcatchersPipe")
RPD.Dungeon.level:drop(item,cell)
end,
interact = function(self, chr)
if not storage.get("interact") then
EPD.showQuestWindow(self, "Здарствуй, человечишка. Не поможешь ли мне? Видишь ли, я потерял свою дудочку. Найди её мне пожалуйста.")
storage.put("interact",true)
return
end
if RPD.Dungeon.hero:getBelongings():getItem("Artifacts/RatcatchersPipe") then
EPD.showQuestWindow(self, "Спасибо тебе большое, проходимец...")
local hero = RPD.Dungeon.hero
hero:getBelongings():getItem("Artifacts/RatcatchersPipe"):detach(hero:getBelongings().backpack)
Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

RPD.permanentBuff(RPD.Dungeon.hero,"Ratcatcher")

self:getSprite():killAndErase()
RPD.Sfx.CellEmitter:get(self:getPos()):start(RPD.Sfx.ElmoParticle.FACTORY, 0.08,2)
self:destroy()
storage.put("complete",true)
elseif not storage.get("complete") then
EPD.showQuestWindow(self, "Это моя любимая дудочка...")
end
end
})

