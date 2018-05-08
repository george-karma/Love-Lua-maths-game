--[[TODO:
 	Add all licences in the 'licences' folder.
--]]
--Code for debbuging in realtime 
io.stdout:setvbuf("no")

--Libraries
	Class = require 'Libraries/classic-master/classic'
	Input = require 'Libraries/boipushy-master/Input'
	Timer = require 'Libraries/hump-master/hump-master/timer'
	Utilities = require 'Libraries/utilities'
	Physics = require "Libraries/windfield/init"
--Libraries

function love.load()
	love.window.setMode(960,720)
--Getting all objects and libraries
	objectFiles = {}
	libraryFiles = {}
	--getFileList("Libraries",libraryFiles)
	--requireFiles(libraryFiles)


	getFileList("Objects", objectFiles)
	requireFiles(objectFiles)
	timer = Timer()
	input = Input()
--Getting all objects and libraries

--Defining Inputs
	input:bind("e","testkey")
--Defining Inputs
	
--Room System
	currentRoom = nil 
	goToRoom("Stage")

--Room System
	


end

function love.update(dt)
	timer:update(dt)
	if currentRoom then currentRoom:update(dt) end


--[[ INPUT EXAMPLES
	if input:pressed('test') then print('pressed') end
    if input:released('test') then print('released') end

    Returns true on every frame that the button is pressed
    if input:down('test') then print('down') end
	
	If the thest binding is held down, every 0.5 seconds the print will appear
    if input:down('test', 0.5) then print('test event') end
--]]

end

function love.draw()
	if currentRoom then currentRoom:draw(dt) end

end

function  goToRoom(roomType)
	currentRoom = _G[roomType]()
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
		--print(file)
	end
end
function SplitFilename(strFilename)
	-- Returns the Path, Filename, and Extension as 3 values
	-- Uses some pattern recognition black magic i should probably look into to do it
	return string.match(strFilename, "(.-)([^\\/]-%.?([^%.\\/]*))$")
end
-- *******FUNCTIONS CALLED ON LOAD********


