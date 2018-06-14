--controll game loop
--not used very well here cause the game is infinite
local Director = Class:extend()
	
function Director:new(room)
	self.room = room
	self.waveNumber = 0
	self.waveDuration = 7
	self.enemyCount = 3
	self.interWaveCool = 2

	timer:every(self.waveDuration, function()
			timer:after(self.interWaveCool, function() 
					self.waveNumber = 1
					self.waveDuration = self.waveDuration + 2.5
					self.enemyCount = self.enemyCount + 1
					timer:every(self.waveDuration/self.enemyCount, function()
						if self.enemyCount > 15 then self.interWaveCool = 15 end
						self.room.area:addGameObject("Asteroid")
				end)
			end)
		end)
end

function Director:update(dt)

end

return Director