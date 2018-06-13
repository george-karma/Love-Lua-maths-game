local Equation = GameObject:extend()

function Equation:new(area,x,y,opts)
	Equation.super.new(self,area,x,y,opts)
	self.order = 52
	self.type = "Equation"
	self.area = area
	self.dead = false
	self.x,self.y=x,y 
	self.equation = nil
	self.equationText = "eq"
	self:createRandomEquation()

end


function Equation:update(dt)
	--deciding the equation

	if self.asteroidObject then
		self.x,self.y = self.asteroidObject.x,self.asteroidObject.y
		if self.asteroidObject.dead then
			self.dead = true
		end
	end
	Equation.super.update(self,dt)
    if self.x < 0 then   self.dead = true end
    if self.y < 0 then   self.dead = true end
    if self.x > self.area.room.screenW then   self.dead = true end
    if self.y > self.area.room.screenH then   self.dead = true end
		

end


function Equation:draw()
	love.graphics.setFont(defaultFont)
	love.graphics.print(self.equationText,self.x,self.y)
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

function Equation:createRandomEquation()

	self.coefficent = random(0,9)
	self.coefficentText = tostring(self.coefficent)
	self.constraint = random(0,9)
	self.constraintText = tostring(self.constraint)
	self.chance = random(0,100)
	

	if self.chance <= 25 then
		self.equation = self.coefficent * self.constraint
		self.equationText = self.coefficentText.."".."*"..""..self.constraintText
	end
	if self.chance > 25 and self.chance <=50 then
		self.equation = self.coefficent / self.constraint
		self.equationText = self.coefficentText.."".."/"..""..self.constraintText
	end
	if self.chance >50 and self.chance <=75 then
		self.equation = self.coefficent + self.constraint
		self.equationText = self.coefficentText.."".."+"..""..self.constraintText
	end
	if self.chance >75 then 
		self.equation = self.coefficent - self.constraint
		self.equationText = self.coefficentText.."".."-"..""..self.constraintText
	end
	
end

function random(a,b)
	return love.math.random(a,b)
end
return Equation
