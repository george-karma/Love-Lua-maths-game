local Trail = Class:extend() 

--the new function is its constructor
function Trail:new(type,x,y,opts)
	
	self.type = type
	self.dead = false
	self.x,self.y=x,y 
	self.type = type
	local opts = opts or {} --in case optional arg is nul
	randomRadius = math.random(-2.5,3)
	for k,v in pairs(opts) do self[k] = v end
	objectFiles = {}
	getFileList("Objects", objectFiles)
	requireFiles(objectFiles)

	timer:tween(0.2 , self, {r = 0},"linear")
	timer:every(0.25,function() self.dead = true end)

end


function Trail:update(dt)
	--angle = math.atan2(playerObject.y - playerObject.previousy, playerObject.x - playerObject.previousx)*180/math.pi

end


function Trail:draw()

	love.graphics.setColor(0, 100, 255)
	love.graphics.circle("fill", self.x, self.y, self.r + randomRadius)
	love.graphics.setColor(255, 255, 255)
end

--this funciton gets the file path for all the items in a folder
function getFileList (folder, filePathList)
	local files = love.filesystem.getDirectoryItems(folder)
	--here i is the key and item is the actual item
	--we iterate the directory items and add them to the filePathList
	for i, file in ipairs(files) do
		local filePath = folder .."/".. file
		if  love.filesystem.isFile(filePath) then
			--insert the file path into the path list
			table.insert(filePathList,filePath)
			elseif love.filesystem.isDirectory(filePath) then
				getFileList(filePath, filePathList)	
		end
	end

end
--This function iterates through the objects we got from GetObjectList
--and makes it so the project requieres them, thus saving time and automatically adding all 
--required objects.
--Also worh mentionsing is that all requiered objects are defined as local in the other file
-- (i.e. circle.lua), but global in the current construct.
function requireFiles(files)
	for i,file in ipairs(files) do
		local file = file:sub(1,-5)
		
		local class = file:sub(9)
		--#parts is the size of parts for lists
		--_G is all global variables defined in the scope
		_G[class] = require(file)
	
	end
end

	

return Trail
