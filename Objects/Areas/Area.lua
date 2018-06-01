--[[
	Area controls when objects are dead and what objects are in it.
	It is basically an interface class between the game objects and the 
	Stage room.
]]--
local Area = Class:extend()

function Area:new(room)
	--reference to the stage the area is in
	self.room = room
	self.gameObjectArray = {}

	--[[Too add a new object type to the screen we will have to create a canvas here for it
		then add an if statement to the draw class to identify the objects from the stack
		then draw them in the proper order]]--
	self.mainCanvas = love.graphics.newCanvas(room.screenW, room.screenH)
	self.mainCanvas:setFilter("nearest","nearest")

	self.trailCanvas = love.graphics.newCanvas(room.screenW, room.screenH)
	self.trailCanvas:setFilter("nearest","nearest")

	self.playerCanvas = love.graphics.newCanvas(room.screenW, room.screenH)
	self.playerCanvas:setFilter("nearest","nearest")


end

function Area:update(dt)
	--We update the physics world before we update game objects so we have update physics information.
	if self.world then self.world:update(dt) end
	--Update the gameObject inside of gameObjectArray and remove dead objects from the array.
	for i = #self.gameObjectArray, 1, -1 do
		local gameObject = self.gameObjectArray[i]
		gameObject:update(dt)
		if gameObject.dead then table.remove(self.gameObjectArray, i) end
	end

	
end

function Area:draw()
	--if self.world then self.world:draw()end
	--draw all the objects inside of gameObjectArray

	for i, gameObject in ipairs(self.gameObjectArray) do
		if gameObject.type == "Player" then
			love.graphics.setCanvas(self.playerCanvas)
				love.graphics.clear()
				gameObject:draw()
			love.graphics.setCanvas()

		elseif gameObject.type == "Trail" then
			love.graphics.setCanvas(self.trailCanvas)
				love.graphics.clear()
				gameObject:draw()
			love.graphics.setCanvas()

		else
			love.graphics.setColor(255, 0, 0)
			love.graphics.print("ERROR: Ga",room.screenW, room.screenH)
			love.graphiccs.setColor(255,255,255)
		end
	end
		
	love.graphics.setCanvas(self.mainCanvas)
		love.graphics.clear()
		
		love.graphics.draw(self.trailCanvas,0,0)
		love.graphics.draw(self.playerCanvas,0,0)
		
	love.graphics.setCanvas()
	love.graphics.draw(self.mainCanvas,0,0,0,3,3)
end

function Area:addGameObject(type,x,y,opts)
	local opts = opts or {}
	--[[
		The self here refers to the current Area, which we pass
		to the game object in order to refer back to the area that
		the game object is in.
	--]]
	local gameObject = _G[type](self,x or 0, y or 0, opts)
	table.insert(self.gameObjectArray, gameObject)
	return gameObject
end

--not every area needs a physics world, just for expansion purposes
function Area:addPhysicsWorld()
	self.world = Physics.newWorld(0,0,true)
end

return Area