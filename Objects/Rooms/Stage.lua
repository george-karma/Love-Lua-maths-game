io.stdout:setvbuf("no")

local Stage = Class:extend()
function Stage:new(opts)
	requireFiles(objectFiles)
	self.area = Area(self)
	scrW, scrH = 320, 240
	if opts ~= nil then
		for k,v in pairs(opts) do self[k] = v end
	end
	
	self.mainCanvas = love.graphics.newCanvas(scrW,scrH)
	self.mainCanvas:setFilter("nearest","nearest")
	love.graphics.setLineStyle("rough")

	self.Player = self.area:addGameObject("Player",scrW/2,scrH/2)

end

function Stage:update(dt)
	self.area:update(dt)

	
end

function Stage:draw()
	love.graphics.setCanvas(self.mainCanvas)
		love.graphics.clear()
		self.area:draw()
	love.graphics.setCanvas()

   -- love.graphics.setColor(255, 255, 255, 255)
    --love.graphics.setBlendMode('alpha', 'premultiplied')
    love.graphics.draw(self.mainCanvas, 0, 0, 0, 3, 3)
   -- love.graphics.setBlendMode('alpha')
end



return Stage

