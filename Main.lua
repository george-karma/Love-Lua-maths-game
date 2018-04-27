--Code for debbuging in realtime playerObject
io.stdout:setvbuf("no")

--Library implementations
Class = require 'Libraries/classic-master/classic'
Input = require 'Libraries/boipushy-master/Input'
Timer = require 'Libraries/vrld-hump-7642755/timer'

--Test = require 'Objects/test'

--Game Loop called when project is run
function love.run()
	--Creates a seed based on the os time for the love.math lirary to use when doing things like love.random .
    if love.math then
			love.math.setRandomSeed(os.time())
    end

     
    --The love.load() function is callled only once to load assets then the loe.update() and love.draw() are 
    --called every frame at  ~ 16.6ms in between.
    -- "arg" are the command line arguments passed to the LOVE exe whn running the project.
    if love.load then love.load(arg) end

    -- We don't want the first frame's dt to include time taken by love.load. For example, if loading the assets
    --takes 15 seconds, we do not want to include those 15 seconds to the game timer.
    if love.timer then love.timer.step() end

    local dt = 0

    -- Main loop time.
    while true do
        -- Process events.
        if love.event then
	    love.event.pump()
	    -- a,b,c,d,e,f are functions like keypresses or window focus lost
	    for name, a,b,c,d,e,f in love.event.poll() do
	        if name == "quit" then
		   		if not love.quit or not love.quit() then
		        	return a
		   		end
	        end
		love.handlers[name](a,b,c,d,e,f)
	    end
	end


  	--love.timer.step measures the time between the two last frames and changes the value returned by 
  	--love.timer.getDelta. So in this case dt will contain the time taken for the last frame to run. 
  	--This is useful because then this value is passed to the love.update function, and from there it can 
  	--be used in the game to define things with constant speeds, despite frame rate changes.
	-- Update dt, as we'll be passing it to update
	if love.timer then
	    love.timer.step()
	    dt = love.timer.getDelta()
	end

	-- Call update and draw
	if love.update then love.update(dt) end -- will pass 0 if love.timer is disabled



	--After calling love.update, love.draw is called. 
	--But before that we verify that the love.graphics module exists
	--and that we can draw to the screen via love.graphics.isActive. 
	--he screen is cleared to the defined background color (initially black) via love.graphics.clear,
	--transformations are reset via love.graphics.origin, love.draw is finally called and then
	--love.graphics.present is used to push everything drawn in love.draw to the screen
	if love.graphics and love.graphics.isActive() then
	   love.graphics.clear(love.graphics.getBackgroundColor())
	    love.graphics.origin()
            if love.draw then love.draw() end
	    love.graphics.present()
		end
		--The thread is put to sleep at the end of the frame for reasons which which are the same as black magic to me.
		if love.timer then love.timer.sleep(0.001) end
    end
end

function love.load()
	--image = love.graphics.newImage("2.png")
	--love.window.setMode(800, 600, {vsync=true})
	
	--array use
	objectFiles = {}
	getFileList("Objects", objectFiles)
	requireFiles(objectFiles)

	timer = Timer()
	input = Input()

	input:bind("mouse1","test")

 	localGameObjectArray ={}

 	createGameObject("PlayerObject",100,50, {r = 25})

	mainCanvas = love.graphics.newCanvas(320,240)
 	mainCanvas:setFilter("nearest","nearest")
 	--creating diffrent canvases for diffrent objects so the trails are drawn behind the ball
 	localGameObjectCanvas = love.graphics.newCanvas(320, 240)
 	--setting upscailing filters, nearest will make it look pixelated like photshop
 	localGameObjectCanvas:setFilter("nearest","nearest")
 	trailCanvas = love.graphics.newCanvas(320,240)
 	trailCanvas:setFilter("nearest","nearest")
 	
	love.window.setMode(960,720)
 	love.graphics.setLineStyle("rough")
end




function love.update(dt)
	timer:update(dt)
--[[
	#gameObejctArray is the length of the array/list
	One of the important things to note here is that we're going through the list backwards. 
	This is because in Lua, whenever something is removed from a list it gets resorted so as to
	leave no nil spaces in it.
	This means that if object 1 and 2 need to be deleted, if we go with a normal forwards loop,
	object 1 will be deleted, the list will be resorted and now object 2 will be object 1,	
	but since we already went to the next iteration, we'll not get to delete
	the original object 2 (because it's in the first position now). 
	To prevent this from happening we go over the list backwards.
--]]
	
	for i = #localGameObjectArray,1,-1 do
		local localGameObject = localGameObjectArray[i]
		localGameObject:update(dt)
		if localGameObject.dead then table.remove(localGameObjectArray,i) end
	end	
end



--[[
	instead of just drawing the game objects directly to the screen, 
	we set mainCanvas with love.graphics.setCanvas, 
	clear the contents from this canvas from the last frame with love.graphics.clear,
	draw the game objects, 
	and then draw the canvas scale up by 3 (love.graphics.draw). 
--]]
function love.draw()
	--We draw objects on seperate canvases as to not have interlap and to be able to manipulate each canvas individually 

	--setting up the trail canvas
	love.graphics.setCanvas(trailCanvas)
		love.graphics.clear()
		for i,localGameObject in ipairs(localGameObjectArray) do
			if localGameObject.type == "Trail" then
				localGameObject:draw()

			end
		end
		angleTrails(160,120,PlayerObject.angle)
		love.graphics.setBlendMode("subtract")
			for i = 0, 360, 2 do
				love.graphics.line(i,0,i,240)
			end
		love.graphics.setBlendMode("alpha")
	love.graphics.setCanvas()


	--setting up the game object canvas
	love.graphics.setCanvas(localGameObjectCanvas)
		love.graphics.clear()
		for i, localGameObject in ipairs(localGameObjectArray) do
			if localGameObject.type == "PlayerObject" then
	       	localGameObject:draw()
	       	
			end
		end
	love.graphics.setCanvas()



	love.graphics.setCanvas(mainCanvas)
		love.graphics.clear()
		love.graphics.draw(trailCanvas,0,0)
		love.graphics.draw(localGameObjectCanvas,0,0)
	love.graphics.setCanvas()

	--we scale the canvas three times
	love.graphics.draw(mainCanvas,0,0,0,3,3)
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


function createGameObject(type,x,y,opts)
	local localGameObject = _G[type](type,x,y,opts)
	table.insert(localGameObjectArray, localGameObject)
	return localGameObject--we just return it just in case
	-- body
end

function angleTrails(xLocation,yLocation,rotation)
	love.graphics.push()
	love.graphics.translate(xLocation,yLocation)
	love.graphics.rotate(rotation or 0)
	love.graphics.translate(-xLocation, -yLocation)
	love.graphics.pop()
end