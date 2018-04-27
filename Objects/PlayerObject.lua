local PlayerObject = Class:extend()


--the new function is its constructor
function PlayerObject:new(type,x,y,opts)

	self.type = type
	self.dead = false	
	self.x,self.y=x,y 
	self.previousx, self.previousy = x, y
	local opts = opts or {} --in case optional arg is nul
	for k,v in pairs(opts) do self[k] = v end
	self.dead = false
	

	timer:every(0.01,function() createGameObject("Trail",self.x,self.y,{r=17})end)

end


function PlayerObject:update(dt)
	local x,y = love.mouse.getPosition()

	self.x, self.y = x/3, y/3

	self.angle = math.atan2(self.y - self.previousy, self.x - self.previousx)
	--print (angle)
	

	self.previousx, previousy = x, y
	
end


function PlayerObject:draw()
	
	
	love.graphics.circle("fill", self.x, self.y, 15)

	
end


return PlayerObject
