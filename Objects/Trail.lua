local Trail = PlayerObject:extend()

--the new function is its constructor
function Trail:new(type,x,y,opts)
	Trail.super.new(self)
	self.type = type
	self.dead = false
	self.x,self.y=x,y 
	self.type = type
	local opts = opts or {} --in case optional arg is nul
	randomRadius = math.random(-2.5,3)
	for k,v in pairs(opts) do self[k] = v end

	timer:tween(0.2 , self, {r = 0},"linear")
	timer:every(0.2,function() self.dead = true end)

end


function Trail:update(dt)
	--angle = math.atan2(playerObject.y - playerObject.previousy, playerObject.x - playerObject.previousx)*180/math.pi

end


function Trail:draw()

	love.graphics.setColor(0, 100, 255)
	love.graphics.circle("fill", self.x, self.y, self.r + randomRadius)


	--self:angleTrails(160,120,playerObject.angle)
	love.graphics.setBlendMode("subtract")
	for i = 0, 360, 2 do
		--love.graphics.setColor(191, 63, 63, 100)
		love.graphics.line(i,0,i,240)
		
	end
	love.graphics.setBlendMode("alpha")
	love.graphics.setColor(255, 255, 255)
end


function Trail:angleTrails(xLocation,yLocation,rotation)
	love.graphics.push()
	love.graphics.translate(xLocation,yLocation)
	love.graphics.rotate(rotation or 0)
	love.graphics.translate(-xLocation, -yLocation)
	love.graphics.pop()
end

return Trail
