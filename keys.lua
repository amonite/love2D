function gx.load()
  Width = 320
  Height = 240
  gx.window.setMode(Width, Height)
  x = Width/2
  y = Height/2
  spd = 50
end 

function gx.update(dt)
  if gx.keyboard.isDown("right") then
    x = x + spd * dt
  
  elseif gx.keyboard.isDown("left") then
    x = x - spd *dt
  
  elseif gx.keyboard.isDown("up") then 
    y = y - spd * dt
  
  elseif gx.keyboard.isDown("down") then
    y = y + spd * dt
  end 
  
end 

function gx.keypressed(key)
    if key == "space" then 
      spd = spd + 10
      print(spd)
    end 
end 

function gx.draw()
  gx.graphics.print("test",10,10)
  gx.graphics.rectangle("line",x,y,25,25)
end 