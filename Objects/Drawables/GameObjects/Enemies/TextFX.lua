local TextFX = GameObject:extend()

function TextFX:new(area,x,y,opts)
	TextFX.super.new(self,area,x,y,opts)
	self.order = 52
	self.type = "TextFX"
	self.area = area
	self.dead = false
	self.x,self.y=x,y 
	self.direction = opts.direction or 5
	self.text = opts.text or ""
	self.colour = opts.colour or marineBlueColour 
	timer:tween(1.5, self, {x = self.x+ opts.direction},"linear",function() self.dead = true end)

end


function TextFX:update(dt)
	--deciding the TextFX
	TextFX.super.update(self,dt)

	if self.asteroidObject then
		self.x,self.y = self.asteroidObject.x,self.asteroidObject.y
		print(self.x)
		if self.asteroidObject.dead then
			self.dead = true
		end
	end
		

end


function TextFX:draw()
	love.graphics.setFont(defaultFont)
	love.graphics.setColor(self.colour)
	love.graphics.print(self.text,self.x,self.y)
	love.graphics.setColor(defaultColour)
end

function TextFX:trash()
	TextFX.super.trash(self)
	
end

function localRotation(xLocation,yLocation,rotation)
	love.graphics.push()
	love.graphics.translate(xLocation,yLocation)
	love.graphics.rotate(rotation or 0)
	love.graphics.translate(-xLocation, -yLocation)
end


function random(a,b)
	return love.math.random(a,b)
end
return TextFX
