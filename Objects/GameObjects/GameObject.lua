

local GameObject = Class:extend()

function GameObject:new(areea,x,y,opts)
	self.x, self.y = x, y
	
	if opts ~= nil then
		for k,v in pairs(opts) do self[k] = v end
	end

	self.areea = areea
	self.x, self.y = x,y
	self.id = createRandomId()
	self.timer = Timer()
	self.dead = false
	self.creationTime = love.timer.getTime()
	
end

function GameObject:update(dt)
	
end

function GameObject:draw()
	

end


function createRandomId()
    local fn = function(x)
        local r = love.math.random(16) - 1
        r = (x == "x") and (r + 1) or (r % 4) + 9
        return ("0123456789abcdef"):sub(r, r)
    end
    return (("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"):gsub("[xy]", fn))
end


return GameObject