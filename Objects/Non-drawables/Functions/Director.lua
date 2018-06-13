--controll game loop
--not used very well here cause the game is infinite
local Director = Class:extend()
	
function Director:new(room)
	self.room = room
	self.waveDuration = 22
end

function Director:update(dt)

end

return Director