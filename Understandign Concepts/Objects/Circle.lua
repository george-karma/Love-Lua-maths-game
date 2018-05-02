local Circle = Class:extend()
function Circle:new(x,y,opts)
	self.x, self.y = x, y
	self.creationTime = love.timer.getTime()
	if opts ~= nil then
		for k,v in pairs(opts) do self[k] = v end
	end
	
end
function Circle:update(dt)

end

function Circle:draw()

	love.graphics.circle("fill", self.x,self.y,self.r or 50)
--[[
	love.graphics.setColor(0,0,255)
	love.graphics.print(tostring(self.creationTime),self.x,self.y)
	love.graphics.setColor(255,255,255)
--]]
end

return Circle