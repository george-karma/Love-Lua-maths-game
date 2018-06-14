--[[-------------------------------RAVEN MASK-------------------------------
           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,       ,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#,,,,,,.         (@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,.,,, ,,,,,        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#.,,,,/##(//,,,,.        .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/*,*.*..##..*,,*,.          %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/,.,*.*(#&&&(*,*            .  ,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,*/,,,(#&&&&&              .((,,((,*(/.*(/(/.*(((@@@@@@@@@@@@@@@@      
           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#%(((, .*((/%#%%%##*             ((##########(((((((/.//,  ***(@@@@@@@@@      
           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(.     ./%%#((///((,           ./(((((((((((((/////////******,*...(.@@@@      
           @@@@@@@@@@@@@@@@@@@@@@@@@@@@(*(,..      (////((((*,       .**//////((((((####(*.((*,.//,../*   *//. /@      
           @@@@@@@@@@@@@@@@@@@@@@@@@@@@/*.,,.      ,,/////((/(/*,****////////#((*.(/,   ,,,,.               ...        
           @@@@@@@@@@@@@@@@@@@@@@@@@@*/.,..         ****/,**/(####%%%%##.#/   ,/*.       ..   *@@@@@@@@@@@@@@@@@@      
           @@@@@@@@@@@@@@@@@@@@@@@@@@*/,..           , ,******,.*(#,&           .        %@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@@@@@@@@@@@@@@@@@@@@**.,..            ,,,*,, ,*/,                     @@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@@@@@@@@@@@@@@@@@@%,..*,..            .*, ***                     /@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@@@@@@@@@@@@@@@@//**.*...,,        .   ,*                     /@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@@@@@@@@@@@@@@@  /,,..             .    ,,.                ,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@@@@@@@@@@@@@*  ,,,      .    ,    .* .      .             @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@@@@@@@@(,/%(%.*,./.      ,. .  ,  *.....  .              .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@@@@@@*..//((....,..,.,..  . ., ,   * ,./.                @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@@@@..  .,,*.......,,...   ..  , ,    .                   .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@@@@   .,..,,*......    . .     .  ,.,  ,                   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@@@..  .(.,.........         *     * (                       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@@@.   ..,,........,.    ,      *.   / *                      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@,*... ..........,,     ,  .  .(*      ,.                     ,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@@.**,...,. .....,..... .  *.  (*.                              #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@/  .***.,.  ,........ ... ,,     ,.                              @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@*   ....   .. *,. .,......  .  .,                                (@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@              ... .......  ,, ..   . ....    .,                   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@                  .  ....    ...    *.. .                          @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@                    .  ..   ......  .                              @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@                       .  .. .  ...                                @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           *.@@   .                      ,.                                       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           **/***,                                                                @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           *,*,..                                                                 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           *..                                                                    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           *                                                                      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           *..                                                                  @ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           /                                                                   /@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      
           @@@@@                                                             ,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  
--]]
--[[TODO:
 	Add all licences in the 'licences' folder.
	Put the off screen die code in the parent object
 	]]--

--Code for debbuging in realtime 
io.stdout:setvbuf("no")	
--Libraries
	require "globals"
	Class = require 'Libraries/classic-master/classic'
	Input = require 'Libraries/boipushy-master/Input'
	Timer = require 'Libraries/chrono-master/Timer'
	Utilities = require 'Libraries/utilities'
	Physics = require "Libraries/windfield"
	Camera = require "Libraries/STALKER-X-master/camera"
	Draft = require "Libraries/draft-master/draft"
--Librariesa

function love.load()
	love.window.setMode(960,720)
--Getting all objects and libraries
	objectFiles = {}
	libraryFiles = {}
	--getFileList("Libraries",libraryFiles)
	--requireFiles(libraryFiles)

	getFileList("Objects", objectFiles)
	requireFiles(objectFiles)
	--we need individual timers mostly if there are 
	timer = Timer()
	input = Input()
	camera = Camera()
	draft = Draft()
	--We need lerping and a follow style otherwise the shake won't work.
	camera:setFollowLerp(0.2)
	camera:setFollowStyle("LOCKON")
	--physics = Physics() 
--Getting all objects and dlibraries

--Defining Inputs
	input:bind("e","testkey")
	input:bind("a","left")
	input:bind("d","right")
	input:bind("t", "die")
	input:bind("return", "restart")
	input:bind("kpenter", "restart")
	input:bind("escape", "exit")
	input:bind("kp0", "0")
	input:bind("kp1", "1")
	input:bind("kp2", "2")
	input:bind("kp3", "3")
	input:bind("kp4", "4")
	input:bind("kp5", "5")
	input:bind("kp6", "6")
	input:bind("kp7", "7")
	input:bind("kp8", "8")
	input:bind("kp9", "9")
	input:bind("kp9", "9")
	input:bind("kp-", "-")
	input:bind("backspace", "backspace")
--Defining Inputs
	
--Garbage Collection Debug
	input:bind('f1', function()
        print("Before collection: " .. collectgarbage("count")/1024)
        collectgarbage()
        print("After collection: " .. collectgarbage("count")/1024)
        print("Object count: ")
        local counts = type_count()
        for k, v in pairs(counts) do print(k, v) end
        print("-------------------------------------")
    end)
--Garbage Collection Debug
--HEAD

-- player
--Room System
	currentRoom = nil 
	goToRoom("StartMenu")
--Room System
end

function love.update(dt)
	timer:update(dt)
	camera:update(dt)

	if currentRoom then currentRoom:update(dt) end
	if currentRoom.player and currentRoom.player.dead == true then
		timer:after(0.5,function() 
			camera:fade(6,{0,0,0,255})
			goToRoom("GameOver")
			camera:fade(3,{0,0,0,0})
		 end)
	end
	--not working at the moment
	--if input:pressed("testkey") then 
	--	camera:shake(3,0.5,60) 
	--end

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
	camera:draw()
	if currentRoom then currentRoom:draw(dt) end
	
end

function  goToRoom(roomType)
	if currentRoom and currentRoom.trash then currentRoom:trash() end
	currentRoom = _G[roomType]()
end


-- *******FUNCTIONS CALLED ON LOAD********a
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

--garbage collection debug console
function count_all(f)
    local seen = {}
    local count_table
    count_table = function(t)
        if seen[t] then return end
            f(t)
	    seen[t] = true
	    for k,v in pairs(t) do
	        if type(v) == "table" then
		    count_table(v)
	        elseif type(v) == "userdata" then
		    f(v)
	        end
	end
    end
    count_table(_G)
end

function type_count()
    local counts = {}
    local enumerate = function (o)
        local t = type_name(o)
        counts[t] = (counts[t] or 0) + 1
    end
    count_all(enumerate)
    return counts
end

global_type_table = nil
function type_name(o)
    if global_type_table == nil then
        global_type_table = {}
            for k,v in pairs(_G) do
	        global_type_table[v] = k
	    end
	global_type_table[0] = "table"
    end
    return global_type_table[getmetatable(o) or 0] or "Unknown"
end
-- *******FUNCTIONS CALLED ON LOAD********



