local Asteroid = GameObject:extend()

function Asteroid:new(area,x,y,opts)
	Asteroid.super.new(self,area,x,y,opts)
	self.order = 51
	self.type = "Asteroid"
	self.area = area
	self.dead = false
	self.x,self.y=x,y 
	self.hp = 20
	
	self.equation = self.area:addGameObject("Equation",self.x,self.y,{asteroidObject = self})

	self.w,self.h = 8,8
	self.collider = self.area.world:newPolygonCollider(createIrregularPolygon(8))
	self.collider:setObject(self)
	self.collider:setFixedRotation(false)
	self.velocity =  love.math.random(10,20)
	self.rotation =  love.math.random(0,2*math.pi)
	self.collider:setLinearVelocity(self.velocity*math.cos(self.rotation),self.velocity*math.sin(self.rotation))
	self.collider:applyAngularImpulse(love.math.random(-100,100))
	self.collider:setCollisionClass("Enemy")
end


function Asteroid:update(dt)
	Asteroid.super.update(self,dt)
    if self.x < 0 then   self.dead = true end
    if self.y < 0 then   self.dead = true end
    if self.x > self.area.room.screenW then   self.dead = true end
    if self.y > self.area.room.screenH then   self.dead = true end

    if self.collider then
  		 if self.collider:enter("Player") then
  		 	local collision_data = self.collider:getEnterCollisionData('Player')
    		self:damage(10)
    		if self.hp == 0 or self.hp<0 then
    			for i = 1, love.math.random(8,12) do
    				self.dead = true
  			 	end
  			 end
    	end
    end
	
end


function Asteroid:draw()
	if self.hp > 10 then
		love.graphics.setColor(marineBlueColour)
	else
		love.graphics.setColor(turqazColour)
	end
	--localRotation(self.x,self.y,self.collider:getAngle())
	local points = {self.collider:getWorldPoints(self.collider.shapes.main:getPoints())}
	love.graphics.polygon("line",points)
	--love.graphics.pop()
	love.graphics.setColor(defaultColour)
end

function Asteroid:trash()
	Asteroid.super.trash(self)
	self.area:addGameObject("PlayerExplosion", self.x, self.y,{colour = turqazColour, tweenTime = 2})
end

function Asteroid:damage(amount)
	self.hp = self.hp-10
	-- body
end

function localRotation(xLocation,yLocation,rotation)
	love.graphics.push()
	love.graphics.translate(xLocation,yLocation)
	love.graphics.rotate(rotation or 0)
	love.graphics.translate(-xLocation, -yLocation)
end

function createIrregularPolygon(size, pointAmount)
    local pointAmount = pointAmount or 8
    local points = {}
    for i = 1, pointAmount do
        local angleInterval = 2*math.pi/pointAmount
        local distance = size + love.math.random(-size/4, size/4)
        local angle = (i-1)*angleInterval + love.math.random(-angleInterval/4, angleInterval/4)
        table.insert(points, distance*math.cos(angle))
        table.insert(points, distance*math.sin(angle))
    end
    return points
end

return Asteroid
