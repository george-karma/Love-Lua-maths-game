io.stdout:setvbuf("no")
--
local Stage = Class:extend()

function Stage:new(opts)
	--We need to access the object in the Stage class because it also acts as an interface.
	requireFiles(objectFiles)

	self.director = Director(self)
	--The "self." modifier is here so we can use the Stage class across multipla gemes/apps.
	--the self in "Area(self)" is a callback to this Stage class
	self.area = Area(self)
	--As I will use this system across multipme implementations, we don't want to always have a physics world atttached.
	self.area:addPhysicsWorld()
	--adding collision classes
	self.area.world:addCollisionClass("Player")
	self.area.world:addCollisionClass("Enemy")
	self.area.world:addCollisionClass("Collectable")

	self.screenW, self.screenH = 320, 240
	if opts ~= nil then
		for k,v in pairs(opts) do self[k] = v end
	end
	
	self.mainCanvas = love.graphics.newCanvas(self.screenW,self.screenH)
	self.mainCanvas:setFilter("nearest","nearest")
	love.graphics.setLineStyle("rough")
	--[[
		The addGameObject returns a reference to the created 
		game object which we can store in order to manipulate and track
		the player from inside the room.
	--]]
	self.player = self.area:addGameObject("Player",self.screenW/2,self.screenH/2)
	

end

function Stage:update(dt)
	
	self.director:update(dt)
	self.area:update(dt)
	--Following the player based on its x and y.
	--camera:follow(self.player.x*3, self.player.y*3)
	
	
	
end

function Stage:draw()
	love.graphics.setCanvas(self.mainCanvas)
		love.graphics.clear()
		self.area:draw()
		--love.graphics.circle("fill", self.screenW/2, self.screenH/2, 5)
	love.graphics.setCanvas()

    camera:attach(0,0,self.screenW,self.screenH)
   	 	love.graphics.draw(self.mainCanvas, 0, 0, 0, 3, 3)
    camera:detach()
end



return Stage

