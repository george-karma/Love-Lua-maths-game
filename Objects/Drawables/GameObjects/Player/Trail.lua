local Trail = GameObject:extend()

--the new function is its constructor but it does not run automatically :(
function Trail:new(area,x,y,opts)
	Player.super.new(self,area,x,y,opts)
	--used to identify the object when deciding the draw order
	self.order = 19
	self.type = "Trail"
	self.area = area
	self.dead = false
	self.x,self.y=x,y 
	randomRadius = math.random(-4,3)

	if self.dead ~= true then
		self.timer:tween(0.3 , self, {radius = 0},"linear")
	end
	self.timer:after(0.2,function() self.dead = true end)

end


function Trail:update(dt)
	Player.super.update(self,dt)
	--angle = math.atan2(y - playerObject.previousy, x - playerObject.previousx)*180/math.pi

end


function Trail:draw()
    love.graphics.setColor(greenColour)
	love.graphics.circle("line", self.x, self.y, self.radius )
	--print(PlayerObject.angle)
	love.graphics.setBlendMode("subtract")
	for i = 0, 360, 2 do
		--love.graphics.setColor(191, 63, 63, 100)
		love.graphics.line(i,0,i,240)
		
	end
	love.graphics.setBlendMode("alpha")
	
	love.graphics.setColor(25,255,150,25)
		love.graphics.circle("line", self.x, self.y, self.radius+6 )
	love.graphics.setColor(defaultColour)

end

--unused function, remove or integrate
-- HEAD:Objects/Drawables/GameObjects/Player/Trail.lua


function Trail:graphicsRotate(xLocation,yLocation,rotation)
-- player:Objects/Drawables/GameObjects/Player/Trail.lua
	love.graphics.push()
	love.graphics.translate(xLocation,yLocation)
	love.graphics.rotate(rotation or 0)
	love.graphics.translate(-xLocation, -yLocation)
end

function Trail:trash()
    Trail.super.trash(self)
end

function Trail:trash()
    Trail.super.trash(self)
end

return Trail
