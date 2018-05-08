local Area = Class:extend()

function Area:new(room)
	self.room = room
	self.gameObjectArray = {}
	print("Area")
end

function Area:update(dt)
	--Update the gameObject inside of gameObjectArray and remove dead objects from the array.
	for i = #self.gameObjectArray, 1, -1 do
		local gameObject = self.gameObjectArray[i]
		gameObject:update(dt)
		if gameObject.dead then table.remove(self.gameObjectArray, i) end
	end
end

function Area:draw()
	--draw all the objects inside of gameObjectArray
	for i, gameObject in ipairs(self.gameObjectArray) do gameObject:draw() end
end

function Area:addGameObject(type,x,y,opts)
	local opts = opts or {}
	local gameObject = _G[type](self,x or 0, y or 0, opts)
	table.insert(self.gameObjectArray, gameObject)
	return gameObject
end
return Area