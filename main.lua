-- breaking
-- dev time: 3 hours 43 minutes

_gfx={}
_gfx.chair = love.graphics.newImage("rsrc/chair.png")
_gfx.dialogue = love.graphics.newImage("rsrc/dialogue.png")
_gfx.mouse = love.graphics.newImage("rsrc/mouse.png")
_gfx.spit = love.graphics.newImage("rsrc/spit.png")
_gfx.table = love.graphics.newImage("rsrc/table.png")
_gfx.flag = love.graphics.newImage("rsrc/flag.png")
_gfx.times = love.graphics.newImage("rsrc/times.png")
_gfx.title = love.graphics.newImage("rsrc/title.png")

_gfx.number={}
_gfx.number[01]= love.graphics.newImage("rsrc/number0.png")
_gfx.number[02]= love.graphics.newImage("rsrc/number1.png")
_gfx.number[03]= love.graphics.newImage("rsrc/number2.png")
_gfx.number[04]= love.graphics.newImage("rsrc/number3.png")
_gfx.number[05]= love.graphics.newImage("rsrc/number4.png")
_gfx.number[06]= love.graphics.newImage("rsrc/number5.png")
_gfx.number[07]= love.graphics.newImage("rsrc/number6.png")
_gfx.number[08]= love.graphics.newImage("rsrc/number7.png")
_gfx.number[09]= love.graphics.newImage("rsrc/number8.png")
_gfx.number[10]= love.graphics.newImage("rsrc/number9.png")

_tune=love.audio.newSource("rsrc/tune.wav","static")
_response=love.audio.newSource("rsrc/response.wav","static")
_oops=love.audio.newSource("rsrc/oops.wav","static")
_control=love.sound.newSoundData("rsrc/control.wav")

_teach=0
_score=0

love.window.setMode(1920,1080,{centered=true,borderless=true})

_tune:play()

_unfinished=false

function love.update()

  local a,si
  si=_tune:tell("samples")
  a=0
  a=_control:getSample(si,1)
  a=a/2+.5
  if a>.75 then _hit=false end
  if _teach and _teach<3 and a<.3 then
    _tune:pause()
    _unfinished=true
  end

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
      
      
  local a,si
  si=_tune:tell("samples")
  a=0
  a=_control:getSample(si,1)
  b=0
  b=_control:getSample(si+600,1)
  
  
  local xo=-50
  
  love.graphics.draw(_gfx.flag,
      _gfx.flag:getWidth()/2-200+xo,
      -_gfx.flag:getHeight()/2+300,
      0,1/2,1/2)
      
  love.graphics.draw(_gfx.times,
      _gfx.times:getWidth()/2-200+175+xo,
      -_gfx.times:getHeight()/2+300-25,
      0,1/2,1/2)
      
  local f=math.floor(_score%10)
  local s=math.floor(_score/10)
  love.graphics.draw(_gfx.number[f+1],
      _gfx.flag:getWidth()/1.25-40+xo,
      -_gfx.flag:getHeight()/1.25+375,
      0,1/1.25,1/1.25)
  love.graphics.draw(_gfx.number[s+1],
      _gfx.flag:getWidth()/1.25-60-40+xo,
      -_gfx.flag:getHeight()/1.25+375,
      0,1/1.25,1/1.25)
  
  
  local l=.008
  if -l<a and a<l and -l<b and b<l then
  
  love.graphics.draw(_gfx.title,
      _gfx.title:getWidth()/1.25-60-40-650,
      -_gfx.title:getHeight()/1.25+375-700,
      0,1/1.25,1/1.25)
  
    return
  end
  
  a=a/4+.5
  a=1/a
      

  
  love.graphics.draw(_gfx.dialogue,
      -_gfx.chair:getWidth()*1/2*a-25,
      -_gfx.chair:getHeight()*1/2*a-450,
      0,1*a,1*a)
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
  
  --for x=0,_score-1 do
  --  love.graphics.draw(_gfx.flag,
  --      _gfx.flag:getWidth()/2-200+x*30,
  --      -_gfx.flag:getHeight()/2+300,
  --      0,1/2,1/2)
  --end
  

  
  
end

function _press(x,y,b,t)


  
  local a,si
  si=_tune:tell("samples")
  a=0
  a=_control:getSample(si,1)
  
  if not _tune:isPlaying() and _unfinished then
    _unfinished=false
    _tune:play()
    _tune:seek(si+8000,"samples")
    _score=_score+1
    _response:play()
    _oopsy=false
    if _teach then _teach=_teach+1 end
  end
  
  local l=.01
  if -l<a and a<l then return end
  
  a=a/2+.5
  --assert(a>.75,"a:"..a)
  if _teach and _teach>=3 and a<.75 and not _hit then
    _response:play()
    _score=_score+1
    _oopsy=false
    _hit=true
  elseif _teach>=3 and not _oopsy then
    _oops:play()
    if _score>0 then _score=_score-1 end
    _oopsy=true
  end

end

function love.mousepressed(x,y,b,t)

  _press()

end

function love.keypressed()

  _press()

end

function love.gamepadpressed()

  _press()

end