--GameObject = require "Objects/GameObjects/GameObject"
local Player = GameObject:extend()

function Player:new(area,x,y,opts)
	Player.super.new(self,area,x,y,opts)

	self.x, self.y = x,y
	self.w, self.h = 12, 12
	--Adding a new colider to the physics world inside of the areea the player is in.
	self.collider = self.area.world:newCircleCollider(self.x,self.y,self.w)
	--attaching the physics collider to the player object
	--We can also use "getObject to "
	self.collider:setObject(self)
	--setGravity has x and y arguments
	--self.area.world:setGravity(0,512)
--MOVEMENT VARIABLES
	--In LÖVE angles work in a clockwise way, meaning math.pi/2 is down and -math.pi/2 is up (and 0 is right)
	self.rotation = -math.pi/2
	self.rotationVelocity = 1.66*math.pi
	self.currentVelocity = 0
	self.maxVelocity = 40
	self.acceleration = 0
--MOVEMENT VARIABLES


end

function Player:update(dt)
	Player.super.update(self,dt)

	local xMouse,yMouse =  love.mouse.get
	self.rotation = math.atan2((yMouse - self.y), (xMouse - self.x))

	print (self.rotation)
	--[[

	if input:down("left") then self.rotation = self.rotation - self.rotationVelocity*dt end
	if input:down("right") then self.rotation = self.rotation + self.rotationVelocity*dt end
	
	--We increase the velocity by the acceleration every second but we cap it at maxVelocity
	--[[self.currentVelocity = self.currentVelocity + self.acceleration*dt
		if self.currentVelocity >= self.maxVelocity then
			self.currentVelocity = self.maxVelocity
	end
	]]--

	self.currentVelocity = math.min(self.currentVelocity+self.acceleration*dt, self.maxVelocity)
	self.collider:setLinearVelocity(self.currentVelocity*math.cos(self.rotation),self.currentVelocity*math.sin(self.rotation))


end

function Player:draw()
		love.graphics.circle("line", self.x, self.y,self.w)
		love.graphics.line(self.x,self.y,self.x+2*self.w*math.cos(self.rotation),self.y+2*self.w*math.sin(self.rotation))
end

function lerp(a,b,t)
	return (1-t)*a + t*b 
end
return Player