local pressedSpace = 0;
local waitingSpace = false;

function onEvent(name, value1, value2)
	if name == 'Character Attack' then
		if value1 == 'slash' or value1 == 'sl4sh' then
			
			if value2 == '1' then
				playSound('slashwarning', 0.5);
				makeAnimatedLuaSprite('slashWarning', 'Stages/MarbleZone/slash_warning_sheet', 329.5, 155.5);
				scaleObject('slashWarning', 2.0, 2.0);
				addAnimationByPrefix('slashWarning', 'slash warning', 'slash warning', 12, false);
				setObjectCamera('slashWarning', 'other');
				addLuaSprite('slashWarning', true);
			elseif value2 == '2' then
				playSound('slashslash', 1);
				playSound('slashslash', 0.5);
			elseif value2 == '3' then
				cameraShake('hud', 0.01, 0.25);
				removeLuaSprite('slashWarning', false);
				runTimer('attackDeathEvent', ((stepCrochet / 1000) * 4), 1);
				waitingSpace = true;
				triggerEvent('Add Camera Zoom', 0.08, 0.08);
			end
			
		end
		if value1 == 'fleet' or value1 == 'fleetway' then
			
			if value2 == '1' then
				--makeAnimatedLuaSprite('spacebar icon', 'exe/images/spacebar_icon', 204, -38.5);
				makeAnimatedLuaSprite('spacebar icon', 'exe/images/spacebar_icon', 422, 160.75);
				scaleObject('spacebar icon', 0.5, 0.5);
				setObjectCamera('spacebar icon', 'other');
				setObjectOrder('spacebar icon', 0);
				addLuaSprite('spacebar icon', true);
			elseif value2 == '2' then
				addAnimationByPrefix('spacebar icon', 'spacebar', 'spacebar', 24, false);
			elseif value2 == '3' then
				playSound('beam', 0.25);
				cameraShake('hud', 0.005, 0.25);
				removeLuaSprite('spacebar icon', false);
				runTimer('attackDeathEvent', ((stepCrochet / 1000) * 4), 1);
				waitingSpace = true;
			end
			
		end
	end
end

function onStepHit()
	if pressedSpace > 0 then
		pressedSpace = pressedSpace - 1;
		if waitingSpace then
			cancelTimer('attackDeathEvent');
			waitingSpace = false;
			objectPlayAnimation('boyfriend', 'dodge', true);
		end
	end
end

function onUpdate()
	if keyJustPressed('space') then
		pressedSpace = 2;
		cancelTimer('attackDeathEvent');
		if waitingSpace then objectPlayAnimation('boyfriend', 'dodge', true) end
		waitingSpace = false;
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'attackDeathEvent' then
		if (pressedSpace == 0) and (not botPlay) then
			setProperty('health', -1);
		else
			objectPlayAnimation('boyfriend', 'dodge', true);
		end
	end
end