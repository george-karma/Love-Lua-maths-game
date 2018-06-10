local Trail = GameObject:extend()

--the new function is its constructor but it does not run automatically :(
function Trail:new(area,x,y,opts)
	Player.super.new(self,area,x,y,opts)
	--used to identify the object when deciding the draw order
	self.type = "Trail"
	self.area = area
	self.dead = false
	self.x,self.y=x,y 
	randomRadius = math.random(-4,3)

	timer:tween(0.2 , self, {x = 0},"linear")
	timer:every(0.2,function() self.dead = true end)

end


function Trail:update(dt)
	Player.super.update(self,dt)
	--angle = math.atan2(y - playerObject.previousy, x - playerObject.previousx)*180/math.pi

end


function Trail:draw()
    love.graphics.setColor(0, 255, 0)
	love.graphics.circle("line", self.x, self.y, self.r + randomRadius)
	--print(PlayerObject.angle)
	love.graphics.setBlendMode("subtract")
	for i = 0, 360, 2 do
		--love.graphics.setColor(191, 63, 63, 100)
		love.graphics.line(i,0,i,240)
		
	end
	love.graphics.setBlendMode("alpha")
	love.graphics.setColor(255, 255, 255)
end

--unused function, remove or integrate
function Trail:angleTrails(xLocation,yLocation,rotation)
	love.graphics.push()
	love.graphics.translate(xLocation,yLocation)
	love.graphics.rotate(rotation or 0)
	love.graphics.translate(-xLocation, -yLocation)
	love.graphics.pop()
end

function Trail:trash()
    Trail.super.trash(self)
end

return Trail
