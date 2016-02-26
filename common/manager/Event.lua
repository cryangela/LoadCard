local Event = class("Event",game.manager.Event);

-- Event.GlobalCount = 0;

-- function Event:define(key)
-- 	if config.Event[key] then
-- 		return config.Event[key];
-- 	end
-- 	Event.GlobalCount = 1 + Event.GlobalCount;
-- 	config.Event[key] = Event.GlobalCount;
-- 	return Event.GlobalCount;
-- end

return Event;