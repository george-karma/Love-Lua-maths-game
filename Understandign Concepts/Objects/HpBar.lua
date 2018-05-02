local HpBar = Class:extend()
function HpBar:new(x,y,opts)
	self.dead=false
	self.x, self.y = x, y
	self.creationTime = love.timer.getTime()
	if opts ~= nil then
		for k,v in pairs(opts) do self[k] = v end
	end
	x1 = 0+self.x
	y1 = 0+self.y
	self.hpFront = 200+self.x
	self.hpBack = 200+self.x
	y2 = 0+self.y
	y3 = 25+self.y
	x4 = 0+self.x
	y4 = 25+self.y	
end
function HpBar:update(dt)
	if self.hpBack == 0 then
		self.dead = true
	end
end
function HpBar:draw()
	love.graphics.setColor(255, 0, 0)
	--love.graphics.polygon("fill", barFront)
	love.graphics.polygon("fill",x1,y1,self.hpFront,y2,self.hpFront,y3,x4,y4)
	love.graphics.setColor(255, 0, 100)
	love.graphics.polygon("line",x1,y1,self.hpBack,y2,self.hpBack,y3,x4,y4)
	--love.graphics.polygon("line",barBack)
	love.graphics.setColor(255, 255, 255)
end
function HpBar:damage(damageAmount)
	hpHandleFront = timer:tween(1,self,{hpFront= self.hpFront-damageAmount},"linear")
	hpHandleBack = timer:tween(1.5,self,{hpBack = self.hpBack-damageAmount}, "linear")
		
end
function HpBar:heal(healAmount)
	timer:cancel(hpHandleBack)
	timer:cancel(hpHandleFront)
	timer:tween(0.3,self,{hpFront = self.hpBack}, "linear")
end
return HpBar