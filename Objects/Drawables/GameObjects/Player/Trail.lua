local Trail = GameObject:extend()

--the new function is its constructor but it does not run automatically :(
function Trail:new(area,x,y,opts)
	Trail.super.new(self,area,x,y,opts)
	--used to identify the object when deciding the draw order
	self.order = 50
	self.type = "Trail"
	self.area = area
	self.dead = false
	self.x,self.y=x,y 
	randomRadius = math.random(-4,3)

	if self.dead ~= true then
		self.timer:tween(0.5 , self, {radius = 0},"linear")
	end
	self.timer:after(0.4,function() self.dead = true end)

end


function Trail:update(dt)
	Trail.super.update(self,dt)
	--angle = math.atan2(y - playerObject.previousy, x - playerObject.previousx)*180/math.pi

end


function Trail:draw()
	if self.area.room.player then
   		love.graphics.setColor(255-self.area.room.player.hpAmount*2,25+self.area.room.player.hpAmount*2,0)
	else
		love.graphics.setColor(greenColour)
	end
	love.graphics.circle("line", self.x, self.y, self.radius )
	--print(PlayerObject.angle)
	love.graphics.setBlendMode("subtract")
	for i = 0, 360, 2 do
		--love.graphics.setColor(191, 63, 63, 100)
		love.graphics.line(i,0,i,240)
		
	end
	love.graphics.setBlendMode("alpha")
	
	love.graphics.setColor(255-self.area.room.player.hpAmount*2,25+self.area.room.player.hpAmount*2,0,25)
		love.graphics.circle("line", self.x, self.y, self.radius+6 )
	love.graphics.setColor(defaultColour)

end

--unused function, remove or integrate
-- HEAD:Objects/Drawables/GameObjects/Player/Trail.lua


function localRotation(xLocation,yLocation,rotation)
-- player:Objects/Drawables/GameObjects/Player/Trail.lua
	love.graphics.push()
	love.graphics.translate(xLocation,yLocation)
	love.graphics.rotate(rotation or 0)
	love.graphics.translate(-xLocation, -yLocation)
end

function Trail:trash()
    Trail.super.trash(self)
end

return Trail
