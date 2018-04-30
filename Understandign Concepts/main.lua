--[[TODO:
 	Add all licences in the 'licences' folder.
--]]

Class = require 'Libraries/classic-master/classic'
Input = require 'Libraries/boipushy-master/Input'
Timer = require 'Libraries/hump-master/hump-master/timer'
--Code for debbuging in realtime s
io.stdout:setvbuf("no")


function love.load()
--Getting all objects and libraries
	objectFiles = {}
	libraryFiles = {}
	--getFileList("Libraries",libraryFiles)
	--requireFiles(libraryFiles)

	--Class = classic

	getFileList("Objects", objectFiles)
	requireFiles(objectFiles)
--Getting all objects and libraries
	
	timer = Timer()
	input = Input()

	initialCircle = HyperCircle(400,300,50,120,{lineWidth = 50})

end

function love.update(dt)
	timer:update(dt)
	initialCircle:update(dt)

end

function love.draw()

	initialCircle:draw()

end

-- *******FUNCTIONS CALLED ON LOAD********
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
--[[
	This function iterates through the objects we got from GetObjectList
	and makes it so the project requieres them, thus saving time and automatically adding all 
	required objects.
	Also worh mentionsing is that all requiered objects are defined as local in the other file
	 (i.e. circle.lua), but global in the current construct.
--]]
function requireFiles(files)
	for i,file in ipairs(files) do
		local path,fileName,extension = SplitFilename(file)
		local file = file:sub(1,-5)	
		fileName = fileName:sub(1,-5)	
		--local typeName = file:sub(9)
		--#parts is the size of parts for lists
		--_G is all global variables defined in the scope
		_G[fileName] = require(file)	
		print(fileName)
	end
end
function SplitFilename(strFilename)
	-- Returns the Path, Filename, and Extension as 3 values
	-- Uses some pattern recognition magic i should probably look into to do it
	return string.match(strFilename, "(.-)([^\\/]-%.?([^%.\\/]*))$")
end
-- *******FUNCTIONS CALLED ON LOAD********



