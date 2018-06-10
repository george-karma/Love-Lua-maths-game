local PlayerExplosion = GameObject:extend()

--the new function is its constructor but it does not run automatically :(
function PlayerExplosion:new(area,x,y,opts)
	Player.super.new(self,area,x,y,opts)
	--used to identify the object when deciding the draw order
	self.type = "PlayerExplosion"
	self.area = area
	self.dead = false
	self.x,self.y=x,y 
	
end


function PlayerExplosion:update(dt)

end


function PlayerExplosion:draw()
	pushRotate(self.x, self.y, self.r)
    love.graphics.setLineWidth(self.line_width)
    love.graphics.setColor(self.color)
    love.graphics.line(self.x - self.s, self.y, self.x + self.s, self.y)
    love.graphics.setColor(255, 255, 255)
    love.graphics.setLineWidth(1)
    love.graphics.pop()
end


function PlayerExplosion:trash()
    PlayerExplosion.super.trash(self)
end

return PlayerExplosion
