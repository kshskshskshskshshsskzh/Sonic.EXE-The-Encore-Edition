function onEvent(name, value1, value2)
    	if name == 'Screamer' then
		screamer = tonumber(value1);
		if screamer == 0 then
			setProperty('screamerTails.visible', true)
			setProperty('daSTAT.visible', true)
			playSound('TailsScreamLOL', 0.1)
		end
		if screamer == 1 then
			setProperty('screamerTails.visible', false)
			setProperty('daSTAT.visible', false)
		end
		if screamer == 2 then
			setProperty('screamerKnuckles.visible', true)
			setProperty('daSTAT.visible', true)
			playSound('KnucklesScreamLOL', 0.1)
		end
		if screamer == 3 then
			setProperty('screamerKnuckles.visible', false)
			setProperty('daSTAT.visible', false)
		end
		if screamer == 4 then
			setProperty('screamerEggman.visible', true)
			setProperty('daSTAT.visible', true)
			playSound('EggmanScreamLOL', 0.1)
		end
		if screamer == 5 then
			setProperty('screamerEggman.visible', false)
			setProperty('daSTAT.visible', false)
		end
    	end
end