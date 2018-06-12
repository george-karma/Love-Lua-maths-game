local Asteroid = GameObject:extend()

function Asteroid:new(area,x,y,opts)
	Asteroid.super.new(self,area,x,y,opts)
	self.order = 51
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
	self.collider:setCollisionClass("Enemy")
end


function Asteroid:update(dt)
	Asteroid.super.update(self,dt)
    if self.x < 0 then   self.dead = true end
    if self.y < 0 then   self.dead = true end
    if self.x > self.area.room.screenW then   self.dead = true end
    if self.y > self.area.room.screenH then   self.dead = true end
	
end


function Asteroid:draw()
	love.graphics.setColor(sunsetRedColour)
	localRotation(self.x,self.y,self.collider:getAngle())
	draft:rhombus(self.x,self.y,self.w,self.h, "line")
	love.graphics.pop()
	love.graphics.setColor(defaultColour)
end

function Asteroid:trash()
	Asteroid.super.trash(self)
	
end

function localRotation(xLocation,yLocation,rotation)
	love.graphics.push()
	love.graphics.translate(xLocation,yLocation)
	love.graphics.rotate(rotation or 0)
	love.graphics.translate(-xLocation, -yLocation)
end

return Asteroid
