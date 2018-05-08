io.stdout:setvbuf("no")
--
local Stage = Class:extend()

function Stage:new(opts)
	--We need to access the object in the Stage class because it also acts as an interface.
	requireFiles(objectFiles)

	--The "self." modifier is here so we can use the Stage class across multipla gemes/apps.
	self.area = Area(self)
	self.area:addPhysicsWorld()

	scrW, scrH = 320, 240
	if opts ~= nil then
		for k,v in pairs(opts) do self[k] = v end
	end
	
	self.mainCanvas = love.graphics.newCanvas(scrW,scrH)
	self.mainCanvas:setFilter("nearest","nearest")
	love.graphics.setLineStyle("rough")
	--[[
		The addGameObject returns a reference to the created 
		game object which we can store in order to manipulate and track
		the player from inside the room.
	--]]
	self.player = self.area:addGameObject("Player",scrW/2,scrH/2)
	

end

function Stage:update(dt)

	self.area:update(dt)
	--Following the player based on its x and y.
	camera:follow(self.player.x*3, self.player.y*3)
	
	
	
	
	
end

function Stage:draw()
	love.graphics.setCanvas(self.mainCanvas)
		love.graphics.clear()
		self.area:draw()
	love.graphics.setCanvas()

    camera:attach(0,0,scrW,scrH)
   	 	love.graphics.draw(self.mainCanvas, 0, 0, 0, 3, 3)
    camera:detach()
end



return Stage

