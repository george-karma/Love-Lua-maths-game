local HyperCircle = Class:extend()
function HyperCircle:new(x,y,r,outerRadius,opts)
	--Circle.super.new(self,x,y,r,opts)
	self.x, self.y = x, y
	self.r = r
	self.outerRadius = outerRadius
	self.creationTims = love.timer.getTime()
	for k,v in pairs(opts) do self[k] = v end

	timer:tween(0.5,self,{lineWidth = 10})
	

end

function HyperCircle:update(dt)
	
end

function HyperCircle:draw()
	love.graphics.circle("fill", self.x,self.y,self.r)
	love.graphics.setLineWidth(self.lineWidth)
	love.graphics.circle("line", self.x,self.y,self.outerRadius)
	
--[[
	love.graphics.setColor(0,0,255)
	love.graphics.print(tostring(self.creationTime),self.x,self.y)
	love.graphics.setColor(255,255,255)
--]]
end

return HyperCircle