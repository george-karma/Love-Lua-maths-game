--Master Game Object so all other game objects can inherit this one's attributes
local GameObject = Class:extend()

function GameObject:new(area,x,y,opts)
	self.x, self.y = x, y
	
	--[[The error "bad argument #1 to 'pairs' (table expected, got number)" is solved by 
		adding the "opts" variable to the class constructor, not just to the inherited class 
		]]-- 
	if opts ~= nil then
		for k,v in pairs(opts) do self[k] = v end
	end

	self.area = area
	self.x, self.y = x,y
	self.id = createRandomId()
	self.timer = Timer()
	self.dead = false
	self.creationTime = love.timer.getTime()
	
end

function GameObject:update(dt)
	--only update the object if needed
	if self.timer then self.timer:update(dt) end
	--if the child object has a collider, then sync the x and y coorinates of the collider and the object
	if self.collider then self.x,self.y = self.collider:getPosition() end
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