--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"

local EPD = require "scripts/lib/dopClasses"


return item.init{
 desc  = function ()
        return {
           image     = 13,
            imageFile = "items/ArtifactsMod.png",
            name      = "Амулет",
            info     = "По словам мага ты сможешь вызывать большие вспески энергии, коснувшись амулета указательным пальцем. Цена - 15 маны.",
            stackable = false,
            upgradable    = true,
             price     = 200,
           isArtifact    = true
        }
    end,   
    actions = function(self, item,  hero)
        if item:isEquipped(hero) then
            return {"ИСПОЛЬЗОВАТЬ"}
        end
        return {}
    end,
        cellSelected = function(self, thisItem, action, cell)
        if action == "ИСПОЛЬЗОВАТЬ" then

mana = RPD.Dungeon.hero:getSkillPoints()
if mana > 15 then
RPD.Dungeon.hero:spendSkillPoints(15)
else
RPD.glog("-- Не хватает маны")
return
end


local dst = RPD.Ballistica:cast(thisItem:getUser():getPos(), cell, true, true, true)
local enemy = RPD.Actor:findChar(dst)
local l = thisItem:level() +1

RPD.playSound( "snd_lightning.ogg" )

local Callback = luajava.bindClass("com.watabou.utils.Callback")
missile = thisItem:getUser():getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset( thisItem:getUser():getPos(),dst,Callback.callback)
missile:size(1);
missile:pour( RPD.Sfx.EnergyParticle.FACTORY, 0.01f);

local level = RPD.Dungeon.level
        local x = level:cellX(dst)
        local y = level:cellY(dst)
        for i = x - 1-l, x + 1+l do
            for j = y - 1-l, y + 1+l do
            local pos = level:cell(i,j)
 local soul =  RPD.Actor:findChar(pos)
            if soul and soul ~= RPD.Dungeon.hero then 
soul:damage(60*l,RPD.Dungeon.hero)
soul:getSprite():emitter():start(RPD.Sfx.EnergyParticle.FACTORY, 0.02,4)
if not level.solid[pos] then
RPD.Sfx.CellEmitter:get(pos):start(RPD.Sfx.EnergyParticle.FACTORY, 0.02, 20)
end
else
if not level.solid[pos] then
RPD.Sfx.CellEmitter:get(pos):start(RPD.Sfx.EnergyParticle.FACTORY, 0.02, 20)
end
end
end
end


end
end,
    execute = function(self, item, hero, action)
        if action == "ИСПОЛЬЗОВАТЬ" then
            item:selectCell("ИСПОЛЬЗОВАТЬ","Выбирете клетку")
        end
    end

}