local Equation = GameObject:extend()

function Equation:new(area,x,y,opts)
	Equation.super.new(self,area,x,y,opts)
	self.order = 52
	self.type = "Equation"
	self.area = area
	self.dead = false
	self.x,self.y=x,y 
	self.points = 10
	self.equation = "45"
	self.equationText = ""
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

	local coefficient = random(0,9)
	self.coefficentText = tostring(coefficient)
	local constraint = random(0,9)
	self.constraintText = tostring(constraint)
	local chance = random(0,100)
	

	if chance <= 25 then
		self.equation = coefficient * constraint
		self.equationText = self.coefficentText.."".."*"..""..self.constraintText
		self.points  = 30
	end
	if chance > 25 and chance <=50 then
		if coefficient % constraint == 0 then
			self.equation = coefficient / constraint
			self.equationText = self.coefficentText.."".."/"..""..self.constraintText
			self.points = 40
		else
			self.equation = coefficient * constraint
			self.equationText = self.coefficentText.."".."*"..""..self.constraintText
			self.points = 30
		end
	end
	if chance >50 and chance <=75 then
		self.equation = coefficient + constraint
		self.equationText = self.coefficentText.."".."+"..""..self.constraintText
		self.points = 20
	end
	if chance >75 then 
		self.equation = coefficient - constraint
		self.equationText = self.coefficentText.."".."-"..""..self.constraintText
		self.points = 10
	end
	
end

function random(a,b)
	return love.math.random(a,b)
end
return Equation
