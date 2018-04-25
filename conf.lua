--We set the internal  rendering resolution for the game here and then upscale 
--it in Main.lua using nearest neibhour so we get the pixelated effect 
function love.conf(t)
	t.window.width = 320
	t.window.heigth = 240
end