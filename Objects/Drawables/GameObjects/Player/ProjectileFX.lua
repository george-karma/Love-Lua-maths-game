local ProjectileFX = GameObject:extend()

--the new function is its constructor but it does not run automatically :(
function ProjectileFX:new(area,x,y,opts)
	Trail.super.new(self,area,x,y,opts)
	--used to identify the object when deciding the draw order
	self.order = 53
	self.type = "FX"
	self.area = area
	self.dead = false
	self.x,self.y=x,y 
	self.w = 8
	--changes the woth of the projectile to 0 over 0.1s
	self.timer:tween(0.1,self,{w=0},"in-out-cubic",function() self.dead = true end)
end


function ProjectileFX:update(dt)
	Trail.super.update(self,dt)
	--by checking that the playerObject exists we avoid some errors
	if self.playerObject then
		self.x =self.playerObject.x + 1.2*self.playerObject.w*math.cos(self.playerObject.rotation)
		self.y =self.playerObject.y + 1.2*self.playerObject.w*math.sin(self.playerObject.rotation)
	end
end


function ProjectileFX:draw()
	localRotation(self.x,self.y,self.playerObject.rotation+  math.pi/4)
  	love.graphics.setColor(turqazColour)
  	love.graphics.rectangle("fill", 
   							self.x-self.w/2,
   							self.y-self.w/2,
   							self.w,self.w)
   	love.graphics.setColor(defaultColour)
   	love.graphics.pop()

end

function ProjectileFX:trash()
    ProjectileFX.super.trash(self)
    --self.playerObject = nil
end

function localRotation(xLocation,yLocation,rotation)
	love.graphics.push()
	love.graphics.translate(xLocation,yLocation)
	love.graphics.rotate(rotation or 0)
	love.graphics.translate(-xLocation, -yLocation)
end
return ProjectileFX
