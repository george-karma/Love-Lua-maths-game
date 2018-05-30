--GameObject = require "Objects/GameObjects/GameObject"
local Player = GameObject:extend()

function Player:new(area,x,y,opts)
	Player.super.new(self,area,x,y,opts)
	--used to identify the object when deciding the draw order
	self.type = "Player"
	self.x, self.y = x,y
	self.w, self.h = 10, 10
	--Adding a new colider to the physics world inside of the area the player is in.
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
	self.acceleration = 20
--MOVEMENT VARIABLES
	timer:every(0.01,function() self.area:addGameObject("Trail",self.x,self.y,{r=17})end)

end

function Player:update(dt)
	Player.super.update(self,dt)

	--change the rotation variable left or right, like old RC cars
	if input:down("left") then self.rotation = self.rotation - self.rotationVelocity*dt end
	if input:down("right") then self.rotation = self.rotation + self.rotationVelocity*dt end

	--Always get the minmimum of the two values, so max velocity is the cap
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