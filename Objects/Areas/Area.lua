--[[
	Area controls when objects are dead and what objects are in it.
	It is basically an interface class between the game objects and the 
	Stage room.
]]--
local Area = Class:extend()

function Area:new(room)
	self.room = room
	self.gameObjectArray = {}
	--print("Area")
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
	for i, gameObject in ipairs(self.gameObjectArray) do gameObject:draw() end
	
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

function Area:addPhysicsWorld()
	self.world = Physics.newWorld(0,0,true)
end

return Area