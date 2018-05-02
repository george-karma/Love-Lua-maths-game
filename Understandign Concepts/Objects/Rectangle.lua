local Rectangle = Class:extend()
function Rectangle:new(x,y,w,h,opts)

	self.x, self.y = x, y
	self.r = r
	self.w,self.h = w,h
	self.creationTime = love.timer.getTime()
	if opts ~= nil then
		for k,v in pairs(opts) do self[k] = v end
	end

end

function Rectangle:update(dt)

end
function Rectangle:draw()
	
	love.graphics.rectangle("line",self.x-self.w/2,self.y-self.h/2,self.w,self.h)
	
	

end

return Rectangle