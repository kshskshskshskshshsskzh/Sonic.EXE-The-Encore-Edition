function onCreate()
   makeLuaSprite('topBar', nil, 0, -160);
   makeGraphic('topBar', getPropertyFromClass('flixel.FlxG', 'width'), 160, '000000');
   screenCenter('topBar', 'x');
   setObjectCamera('topBar', 'camOther');
   addLuaSprite('topBar', true);

   makeLuaSprite('bottomBar', nil, 0, 720);
   makeGraphic('bottomBar', getPropertyFromClass('flixel.FlxG', 'width'), 160, '000000');
   screenCenter('bottomBar', 'x');
   setObjectCamera('bottomBar', 'camOther');
   addLuaSprite('bottomBar', true);
end

function onEvent(name, value1, value2)
   if name == 'Cutscene Bars Appear' then
	  if value1 == '0' then
	     doTweenY('bottomBarMoveIn', 'bottomBar', 560, 0.4, 'expoInOut');
	     doTweenY('topBarMoveIn', 'topBar', 0, 0.4, 'expoInOut');
	  elseif value1 == '1' then
	     doTweenY('bottomBarMoveOut', 'bottomBar', 720, 0.4, 'expoInOut');
	     doTweenY('topBarMoveOut', 'topBar', -160, 0.4, 'expoInOut');
	  end
   end
end