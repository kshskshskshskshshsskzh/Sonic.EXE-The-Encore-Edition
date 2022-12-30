local activated = false;

function onEvent(name, value1, value2)
	if name == "addCamBeatZoom" then
	
		activated = true;
		
		if value1 == '0' and value2 == '0' then
			activated = false;
		end
		
	end
end

function onBeatHit()

	if activated then
		triggerEvent('Add Camera Zoom', value1, value2);
	end
	
end