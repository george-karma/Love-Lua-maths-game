
local StartMenu = Class:extend()

function StartMenu:new(opts)
	--We need to access the object in the StartMenu class because it also acts as an interface.
	requireFiles(objectFiles)

	--The "self." modifier is here so we can use the StartMenu class across multipla gemes/apps.
	--the self in "Area(self)" is a callback to this StartMenu class
	self.area = Area(self)
	self.screenW, self.screenH = 320, 240
	self.mainCanvas = love.graphics.newCanvas(self.screenW,self.screenH)
	self.mainCanvas:setFilter("nearest","nearest")
	love.graphics.setLineStyle("rough")

	self.alpha = 255
	self.image1 = love.graphics.newImage("Resources/Img/start1small.png")
	self.image2 = love.graphics.newImage("Resources/Img/start2small.png")
	self.image3 = love.graphics.newImage("Resources/Img/logoSmall.png")
	self.textX, self.textY = 0,0
	self.text ="RAVEN MASK"
	self.text2 = ""
	self.text2Size = 10


	--Intro sequence
	self.interImage = self.image3
	cancelHandle =
		timer:after(1.5,
		function()
			logoSound:play()
			timer:tween(1.7, self, {alpha = 0}, "linear", 
			function()
				self.interImage = self.image1
				self.text = "Use A and D to steer your ship"
				timer:tween(4, self, {alpha = 255}, "linear",
				function()
					timer:tween(1, self, {alpha = 0}, "linear",
					function()
						self.interImage = self.image2
						self.text = [[Use the numpad to enter the correct answer
												Then smash into the incoming asteroids]]
						timer:tween(1, self, {alpha = 255}, "linear",
						function()
							self.text2 = "Press E to play"
							timer:tween(2, self, {text2Size = 1.5}, "linear")
						end)
					end)
				end)
			end)
		end)

end

function StartMenu:update(dt)
	self.area:update(dt)
	if input:pressed("start") then
		
		timer:cancel(cancelHandle)
		timer:tween(1, self, {alpha = 255}, "linear", function()goToRoom("Stage") end)	
	end
	--Following the player based on its x and y.
	--camera:follow(self.player.x*3, self.player.y*3)	
	
end

function StartMenu:draw()

	love.graphics.setCanvas(self.mainCanvas)
		love.graphics.clear()
		self.area:draw()
		love.graphics.setFont(defaultFont)
		love.graphics.setColor(255, 255, 255, self.alpha)
		love.graphics.draw(self.interImage,0,0)

		love.graphics.printf(self.text, self.screenW/2-140, self.screenH-60,240,"center")
		love.graphics.setFont(defaultFont)
		love.graphics.print(self.text2, self.screenW/2, self.screenH/2-40,0,self.text2Size,self.text2Size)
		
		--love.graphics.print("Game Over",self.screenW/2,self.screenH/2, 180 ,  self.sx, self.sy)
		love.graphics.setColor(defaultColour)

	love.graphics.setCanvas()




    camera:attach(0,0,self.screenW,self.screenH)
   	 	love.graphics.draw(self.mainCanvas, 0, 0, 0, 3, 3)
    camera:detach()
end




return StartMenu

