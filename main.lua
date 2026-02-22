-- working

_gfx={}
_gfx.chair = love.graphics.newImage("rsrc/chair.png")
_gfx.dialogue = love.graphics.newImage("rsrc/dialogue.png")
_gfx.mouse = love.graphics.newImage("rsrc/mouse.png")
_gfx.spit = love.graphics.newImage("rsrc/spit.png")
_gfx.table = love.graphics.newImage("rsrc/table.png")

_tune=love.audio.newSource("rsrc/tune.wav","static")
_response=love.audio.newSource("rsrc/response.wav","static")
_control=love.sound.newSoundData("rsrc/control.wav")

love.window.setMode(1920,1080,{centered=true,borderless=true})

_tune:play()

function love.update()

end

function love.draw()

  love.graphics.clear(1,1,1,1)
  love.graphics.setColor(1,1,1,1)
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
  if _response:isPlaying() then
    love.graphics.draw(_gfx.spit,
        -_gfx.spit:getWidth()*1.25/2-300,
        -_gfx.spit:getHeight()*1.25/2-200,
        0,1.25,1.25)
  else
    love.graphics.draw(_gfx.mouse,
        -_gfx.mouse:getWidth()*1.5/2-300,
        -_gfx.mouse:getHeight()*1.5/2-200,
        0,1.5,1.5)
  end
  love.graphics.draw(_gfx.mouse,
      _gfx.mouse:getWidth()*1.5/2+300,
      -_gfx.mouse:getHeight()*1.5/2-200,
      0,-1.5,1.5)
  love.graphics.draw(_gfx.dialogue,
      -_gfx.chair:getWidth()*1/2-25,
      -_gfx.chair:getHeight()*1/2-450,
      0,1,1)
  --love.graphics.draw(_gfx.chair,500,200,0,-1,1)
  
  local a,si
  si=_tune:tell("samples")
  a=0
  a=_control:getSample(si,2)
  a=math.floor((a+1)/2*4)
  --if a>2 then a=2 end
  if a==-1 then a=0 end
  --assert(a>=0,"a:"..a)
  local w,z=-80,-460
  for x=2,a,-1 do
    love.graphics.setColor(1,1,1,1)
    love.graphics.circle("fill",w+x*64,z,24)
  end
  
end

function love.mousepressed(x,y,b,t)

  local a,si
  si=_tune:tell("samples")
  a=0
  a=_control:getSample(si,1)
  
  local l=.01
  if -l<a and a<l then return end
  
  a=a/2+.5
  --assert(a>.75,"a:"..a)
  if a<.75 then
    _response:play()
  end

end