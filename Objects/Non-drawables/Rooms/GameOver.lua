
local GameOver = Class:extend()

function GameOver:new(opts)
	--We need to access the object in the GameOver class because it also acts as an interface.
	requireFiles(objectFiles)

	--The "self." modifier is here so we can use the GameOver class across multipla gemes/apps.
	--the self in "Area(self)" is a callback to this GameOver class
	self.area = Area(self)
	self.screenW, self.screenH = 320, 240
	self.mainCanvas = love.graphics.newCanvas(self.screenW,self.screenH)
	self.mainCanvas:setFilter("nearest","nearest")
	love.graphics.setLineStyle("rough")
	self.sound = deathTheme
	self.sound:fadeIn()
	--self.sound:play()
	--size of text
	self.sx , self.sy = 10,10
	timer:tween(0.5,self,{sx = 1, sy=1},"in-quart")
	timer:after(1,function() camera:shake(6,0.25,60)end)


end

function GameOver:update(dt)
		
	self.area:update(dt)
	if input:pressed("exit") then
		self.sound:fadeOut()
		self.sound:stop()
		love.event.quit()
		
	end
	if input:pressed("restart") then
		self.sound:fadeOut()
		self.sound:stop()
		love.load()
		
	end

	
end

function GameOver:draw()

	love.graphics.setCanvas(self.mainCanvas)
		love.graphics.clear()
		self.area:draw()
		love.graphics.setColor(sunsetRedColour)
		love.graphics.setFont(defaultFont)
		love.graphics.print("Game Over", self.screenW/2,self.screenH/2,0,self.sx, self.sy,-40)
		love.graphics.print("Press Enter to restart or Escape to exit", 10,200,0,1,1)
		--love.graphics.print("Game Over",self.screenW/2,self.screenH/2, 180 ,  self.sx, self.sy)
		love.graphics.setColor(defaultColour)

	love.graphics.setCanvas()




    camera:attach(0,0,self.screenW,self.screenH)
   	 	love.graphics.draw(self.mainCanvas, 0, 0, 0, 3, 3)
    camera:detach()
end



return GameOver

