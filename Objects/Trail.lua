local Trail = Class:extend() 
local PlayerObject = require "Objects/PlayerObject"
--the new function is its constructor
function Trail:new(type,x,y,opts)
	
	self.type = type
	self.dead = false
	self.x,self.y=x,y 
	self.type = type
	local opts = opts or {} --in case optional arg is nul
	randomRadius = math.random(-2.5,3)
	for k,v in pairs(opts) do self[k] = v end
	angle = self.angle or 90
	timer:tween(0.2 , self, {r = 0},"linear")
	timer:every(0.2,function() self.dead = true end)

end


function Trail:update(dt)
	
end


function Trail:draw()

	love.graphics.setColor(255, 0, 120)
	--Trail:angleTrails(160,120,angle)
	love.graphics.circle("fill", self.x, self.y, self.r + randomRadius)
		love.graphics.setBlendMode("subtract")
			for i = 0, 360, 3 do
				love.graphics.line(i,-240,i,480)
			end
		love.graphics.setBlendMode("alpha")
		--love.graphics.pop()
	--love.graphics.circle("fill", self.x, self.y, self.r + randomRadius)
	love.graphics.setColor(255, 255, 255)
end


function Trail:angleTrails(xLocation,yLocation,rotation)
	love.graphics.push()
	love.graphics.translate(xLocation,yLocation)
	love.graphics.rotate(rotation or 0)
	love.graphics.translate(-xLocation, -yLocation)
	--love.graphics.pop()
end
	

return Trail
