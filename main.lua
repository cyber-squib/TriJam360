_gfx={}
_gfx.chair = love.graphics.newImage("rsrc/chair.png")
_gfx.dialogue = love.graphics.newImage("rsrc/dialogue.png")
_gfx.mouse = love.graphics.newImage("rsrc/mouse.png")
_gfx.spit = love.graphics.newImage("rsrc/spit.png")
_gfx.table = love.graphics.newImage("rsrc/table.png")

love.window.setMode(1920,1080,{centered=true,borderless=true})

function love.update()

end

function love.draw()
  love.graphics.draw(_gfx.chair, 300, 200)
end