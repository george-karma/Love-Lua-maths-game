local Equation = GameObject:extend()

function Equation:new(area,x,y,opts)
	Equation.super.new(self,area,x,y,opts)
	self.order = 52
	self.type = "Equation"
	self.area = area
	self.dead = false
	self.x,self.y=x,y 

end


function Equation:update(dt)
	Equation.super.update(self,dt)
    if self.x < 0 then   self.dead = true end
    if self.y < 0 then   self.dead = true end
    if self.x > self.area.room.screenW then   self.dead = true end
    if self.y > self.area.room.screenH then   self.dead = true end
	
end


function Equation:draw()
	
end

function Equation:trash()
	Equation.super.trash(self)
	
end

function localRotation(xLocation,yLocation,rotation)
	love.graphics.push()
	love.graphics.translate(xLocation,yLocation)
	love.graphics.rotate(rotation or 0)
	love.graphics.translate(-xLocation, -yLocation)
end

function createRandomEquation()
	
end

function random(a,b)
	return love.math.random(a,b)
end
return Equation
