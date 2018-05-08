--We set the internal  rendering resolution for the game here and then upscale 
--it in Main.lua using nearest neibhour so we get the pixelated effect 
function love.conf(t)
	t.identity = nil
	t.version = "0.10.2"
	t.console = false

	t.window.title = "MATLUV"
	t.window.icon = nil
	t.window.width = 320
	t.window.heigth = 240
	t.window.borderless = false
	--t.window.resizable = true
	t.window.fulscreen = false
	t.window.fulscreentype = "exclusive"
	t.window.vsync = true
	--t.window.fsaa = 0
	t.window.display = 1
	


    t.modules.audio = true 
    t.modules.event = true            
    t.modules.graphics = true          
    t.modules.image = true             
    t.modules.joystick = true 
    t.modules.keyboard = true          
    t.modules.math = true             
    t.modules.mouse = true           
    t.modules.physics = true 
    t.modules.sound = true 
    t.modules.system = true            
    t.modules.timer = true             
    t.modules.window = true           
end