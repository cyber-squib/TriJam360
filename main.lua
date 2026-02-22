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
  love.graphics.clear(1,1,1,1)
  love.graphics.translate(1920/2,1080*5/8)
  love.graphics.draw(_gfx.table,
      -_gfx.chair:getWidth()*1.25/2-25,
      -_gfx.chair:getHeight()*1.25/2-100,
      0,1.25,1.25)
  love.graphics.draw(_gfx.chair,
      -_gfx.chair:getWidth()/2-300,
      -_gfx.chair:getHeight()/2)
  love.graphics.draw(_gfx.chair,
      _gfx.chair:getWidth()/2+300,
      -_gfx.chair:getHeight()/2,
      0,-1,1)
  love.graphics.draw(_gfx.mouse,
      -_gfx.mouse:getWidth()*1.5/2-300,
      -_gfx.mouse:getHeight()*1.5/2-200,
      0,1.5,1.5)
  love.graphics.draw(_gfx.mouse,
      _gfx.mouse:getWidth()*1.5/2+300,
      -_gfx.mouse:getHeight()*1.5/2-200,
      0,-1.5,1.5)
  love.graphics.draw(_gfx.dialogue,
      -_gfx.chair:getWidth()*1/2-25,
      -_gfx.chair:getHeight()*1/2-450,
      0,1,1)
  --love.graphics.draw(_gfx.chair,500,200,0,-1,1)
end

-- breaking