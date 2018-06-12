local Answer = GameObject:extend()

--the new function is its constructor but it does not run automatically :(
function Answer:new(area,x,y,opts)
	Answer.super.new(self,area,x,y,opts)
	--used to identify the object when deciding the draw order
	self.order = 54
	self.type = "Answer"
	self.area = area
	self.dead = false
	self.x,self.y=x,y 
end


function Answer:update(dt)
	Answer.super.update(self,dt)
	self.x,self.y = self.playerObject.x, self.playerObject.y
end


function Answer:draw()
	
	love.graphics.setColor(turqazColour)
	love.graphics.setFont(defaultFont)
	love.graphics.print("Test", self.x, self.y,0,1,1,10,8)
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
