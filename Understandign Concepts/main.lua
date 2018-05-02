--[[TODO:
 	Add all licences in the 'licences' folder.
--]]
--Code for debbuging in realtime 
io.stdout:setvbuf("no")

--Libraries
	Class = require 'Libraries/classic-master/classic'
	Input = require 'Libraries/boipushy-master/Input'
	Timer = require 'Libraries/hump-master/hump-master/timer'
--Libraries

function love.load()
--Getting all objects and libraries
	objectFiles = {}
	libraryFiles = {}
	--getFileList("Libraries",libraryFiles)
	--requireFiles(libraryFiles)

	--Class = classic

	getFileList("Objects", objectFiles)
	requireFiles(objectFiles)
	timer = Timer()
	input = Input()
--Getting all objects and libraries

--Defining Inputs
	input:bind("e","testkey")
	input:bind("r","testkey2")
--Defining Inputs

	

	shape = Rectangle(400,300,50,200)
	shape2 = Rectangle(400,300,200,50)
	--
	healthBar = HpBar(300,100)
end

function love.update(dt)
	timer:update(dt)
	healthBar:update(dt)
	
--Defining the object in a driffrent class and tweening it in the main class
	if input:pressed ("testkey") then 
		healthBar:damage(100)
		timer:tween(1,shape,{w=1},"in-out-cubic")
		timer:after(1,function()
			timer:tween(1,shape2,{h=1},"in-out-cubic")
			timer:after(1,function()
				timer:tween(1,shape,{w=50},"in-out-cubic")
				timer:tween(1,shape2,{h=50},"in-out-cubic")
			end)
		end)
	end
	if input:pressed("testkey2") then
		healthBar:heal(70)
	end
	


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
	love.graphics.print("Press E",500,500)
	shape:draw()
	shape2:draw()
	healthBar:draw()

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
	-- Uses some pattern recognition black magic i should probably look into to do it
	return string.match(strFilename, "(.-)([^\\/]-%.?([^%.\\/]*))$")
end
-- *******FUNCTIONS CALLED ON LOAD********



