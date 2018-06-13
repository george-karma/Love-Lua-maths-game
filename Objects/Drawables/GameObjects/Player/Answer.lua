local Answer = GameObject:extend()

--the new function is its constructor but it does not run automatically :(
function Answer:new(area,x,y,opts)
	Answer.super.new(self,area,x,y,opts)
	--used to identify the object when deciding the draw order
	self.order = 54
	self.answer = ""
	self.area = area
	self.dead = false
	self.x,self.y=x,y 
end


function Answer:update(dt)
	Answer.super.update(self,dt)
	self.x,self.y = self.playerObject.x, self.playerObject.y
	if input:pressed("backspace")then self.answer = self.answer:sub(1,-2) end
	if input:pressed("0")then self.answer = self.answer .. 0 end
	if input:pressed("1")then self.answer = self.answer .. 1 end
	if input:pressed("2")then self.answer = self.answer .. 2 end
	if input:pressed("3")then self.answer = self.answer .. 3 end
	if input:pressed("4")then self.answer = self.answer .. 4 end
	if input:pressed("5")then self.answer = self.answer .. 5 end
	if input:pressed("6")then self.answer = self.answer .. 6 end
	if input:pressed("7")then self.answer = self.answer .. 7 end
	if input:pressed("8")then self.answer = self.answer .. 8 end
	if input:pressed("9")then self.answer = self.answer .. 9 end
	if input:pressed("9")then self.answer = self.answer .. 9 end
end


function Answer:draw()
	
	love.graphics.setColor(blueColour)
	love.graphics.setFont(defaultFont)
	love.graphics.print(self.answer, self.x, self.y,0,1,1,11,8)
	love.graphics.setColor(defaultColour)
end

--unused function, remove or integrate
-- HEAD:Objects/Drawables/GameObjects/Player/Answer.lua


function localRotation(xLocation,yLocation,rotation)
-- player:Objects/Drawables/GameObjects/Player/Answer.lua
	love.graphics.push()
	love.graphics.translate(xLocation,yLocation)
	love.graphics.rotate(rotation or 0)
	love.graphics.translate(-xLocation, -yLocation)
end

function Answer:trash()
    Answer.super.trash(self)
end



return Answer
