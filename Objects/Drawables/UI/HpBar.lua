local HpBar = GameObject:extend()
function HpBar:new(area,x,y,opts)
	HpBar.super.new(self,area,opts)
	self.dead=false
	self.order = 55
	self.x, self.y = x, y
	--define vertices
	x1 = 0+self.x
	y1 = 0+self.y
	self.hpFront = 100+self.x
	self.hpBack = 100+self.x
	self.gage = 100+self.x
	y2 = 0+self.y
	y3 = 10+self.y
	x4 = 0+self.x
	y4 = 10+self.y	
	--define vertices
end
function HpBar:update(dt)
	HpBar.super.update(self,dt)
	if self.hpBack == 0 then
		self.dead = true
	end
end
function HpBar:draw()
	love.graphics.setColor(255, 0, 0,200)
	--love.graphics.polygon("fill", barFront)
	love.graphics.polygon("fill",x1,y1,self.hpFront,y2,self.hpFront,y3,x4,y4)

	love.graphics.setColor(255, 0, 150)
	love.graphics.polygon("line",x1,y1,self.hpBack,y2,self.hpBack,y3,x4,y4)
	love.graphics.setColor(defaultColour,255)
	love.graphics.polygon("line",x1,y1,self.gage,y2,self.gage,y3,x4,y4)
	--love.graphics.polygon("line",barBack)
	love.graphics.setColor(255, 255, 255)
end
function HpBar:damage(damageAmount)
	hpHandleFront = timer:tween(0.5,self,{hpFront= self.hpFront-damageAmount},"linear",function()
		hpHandleBack = timer:tween(0.5,self,{hpBack = self.hpBack-damageAmount}, "linear")
		end)
		
end
function HpBar:heal(healAmount)
	timer:tween(0.2,self,{hpBack = self.hpBack+healAmount}, "linear",function()
		timer:tween(0.3,self,{hpFront = self.hpFront+healAmount},"linear")
		 end)
end
function HpBar:trash()
    HpBar.super.trash(self)
end
return HpBar