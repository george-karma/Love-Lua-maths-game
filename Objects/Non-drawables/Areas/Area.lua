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

end

function Area:update(dt)
	--We update the physics world before we update game objects so we have update physics information.
	if self.world then self.world:update(dt) end
	--Update the gameObject inside of gameObjectArray and remove dead objects from the array.
	for i = #self.gameObjectArray, 1, -1 do
		local gameObject = self.gameObjectArray[i]
		if gameObject.dead then 
			table.remove(self.gameObjectArray, i) 
			gameObject:trash()
			
		end
		gameObject:update(dt)
		--we trash the object so there are no references to it, just like it deserves
		-- HEAD:Objects/Non-drawables/Areas/Area.lua
		-- player:Objects/Non-drawables/Areas/Area.lua	
	end
end

function Area:draw()
	--if self.world then self.world:draw()end
	--draw all the objects inside of gameObjectArray
	table.sort(self.gameObjectArray, function(a,b)
			if a.order and b.order then
				return a.order<b.order
			end
		end)

	for i, gameObject in ipairs(self.gameObjectArray) do
		gameObject:draw()
	end
		
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

--garbage collection
function Area:trash()
	--Trashing all the gameobjects in this level
	for i = #self.gameObjectArray, 1, -1 do
		local gameObject = self.gameObjectArray[i]
		gameObject:trash()
		table.remove(self.gameObjectArray,i)
	end
	--trashing the array itself
	self.gameObjectArray = {}

	--trashing the physics world and the reference to it
	if self.world then 
		self.world:destroy()
		self.world = nil
	end
end

return Area