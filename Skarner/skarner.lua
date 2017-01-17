if myHero.charName ~= "Skarner" then return end

require "DamageLib"

Callback.Add('Load',function()
	PrintChat("Skarner")
end)

Q = {Delay = 0.25, Radius = 200, Range = 100, Speed = 2000, Collision = false}
W = {Delay = 0.25, Radius = 1, Range = 1, Speed = 1, Collision = true}
E = {Delay = 0.25, Radius = 230, Range = 980, Speed = 1500, Collision = false}
R = {Delay = 0.25, Radius = 200, Range = 350, Speed = 1, Collision = true}

Menu:MenuElement({type = MENU, id = "Key", name = "Key Settings"})
Menu.Key:MenuElement({id = "ComboKey", name = "Combo Key", key = 32})
Menu.Key:MenuElement({id = "FarmKey", name = "Farm Key", key = 86})

Menu:MenuElement({type = MENU, id = "Combo", name = "Combo Settings"})
Menu.Combo:MenuElement({id = "Q", name = "Q", value = true})
Menu.Combo:MenuElement({id = "W", name = "W", value = true})
Menu.Combo:MenuElement({id = "E", name = "E", value = true})
Menu.Combo:MenuElement({id = "E", name = "R, value = true})

Menu:MenuElement({type = MENU, id = "Farm", name = "Farm Settings"})
Menu.Farm:MenuElement({id = "Farm", name = "Farm", value = true})
Menu.Farm:MenuElement({id = "FQ", name = "Use Q", value = true}
Menu.Farm:MenuElement({id = "FE", name = "Use E", value = true}

function GetTarget(targetRange)
	local result
	for i = 1,Game.HeroCount()  do
		local hero = Game.Hero(i)
		if isValidTarget(hero, targetRange) and hero.team ~= myHero.team then
      		result = hero
      		break
		end
	end
	return result
end

Callback.Add('Tick',function()

	if Menu.Key.Combokey:Value()  then
		if isReady(_Q) and Menu.Combo.Q:Value() then
			local qTarget = GetTarget(Q.Range()
			if qTarget and qTarget:GetCollision(Q.Radius, Q.Speed, Q.Delay) == 0 then
				Control.CastSpell(HK_Q, qPos)
			end
		end
		if isReady(_W) and Menu.Combo.ComboW:Value() then
			Control.CastSpell("HK_W)
			end
		end

		if isReady(_e) and Menu.Combo.ComboW:Value() then
			local wTarget = GetTarget(W.Range()
			if eTarget then
				local wPos = wTarget:GetPrediction(E.Radius, W.Speed, W.Delay)
				Control.CastSpell(HK_E, EPos)
			end
		end

		if isReady(_R) and Menu.Combo.ComboW:Value() then
			local wTarget = GetTarget(W.Range * Menu.Misc.MaxRange:Value())
			if wTarget then
				local wPos = wTarget:GetPrediction(R.Radius, R.Delay)
				Control.CastSpell(HK_R,)
			end
		end

		if Menu.Key.FarmKey:Value() and Menu.Farm.Farm:Value() then
			local qMinion = GetFarmTarget(Q.Range()
				Control.CastSpell(HK_Q)
			end
		end
	end

end)
