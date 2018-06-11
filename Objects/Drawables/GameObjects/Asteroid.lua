local Asteroid = GameObject:extend()

function Asteroid:new(area,x,y,opts)
	Asteroid.super.new(self,area,x,y,opts)

	self.type = "Asteroid"
	self.area = area
	self.dead = false
	self.x,self.y=x,y 
	

	self.w,self.h = 8,8
	self.collider = self.area.world:newRectangleCollider(self.x, self.y, self.w,self.h)
	self.collider:setObject(self)
	self.collider:setFixedRotation(false)
	self.velocity =  love.math.random(10,20)
	self.rotation =  love.math.random(0,2*math.pi)
	self.collider:setLinearVelocity(self.velocity*math.cos(self.rotation),self.velocity*math.sin(self.rotation))
	self.collider:applyAngularImpulse(love.math.random(-24,24))
	self.are.worl:addCollisionClass("Enemy")
end


function Asteroid:update(dt)
	Asteroid.super.update(self,dt)
	
end


function Asteroid:draw()
	love.graphics.setColor(sunsetRedColour)
	localRotation(self.x,self.y,self.collider:getAngle())
	love.graphics.pop()
	love.graphics.setColor(defaultColour)
end

function Asteroid:trash()
	Asteroid.super.trash()
	
end

function localRotation(xLocation,yLocation,rotation)
	love.graphics.push()
	love.graphics.translate(xLocation,yLocation)
	love.graphics.rotate(rotation or 0)
	love.graphics.translate(-xLocation, -yLocation)
end

return Asteroid
