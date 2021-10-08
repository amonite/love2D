function gx.load()
  gx.window.setMode(320,240)
  -- First we create 2 simple objects 
  en1 = {
    x = 10,
    y = 10,
    w = 20,
    h = 20
  }
  en2 = {
    x = 100,
    y = 110,
    w = 20,
    h = 20
  }

  function checkForCollisions(a,b)

    if a.x + a.w > b.x and a.x < b.x + b.w and a.y + a.h > b.y and a.y < b.y + b.h then 
      return true 
    else 
      return false
  end 

end 
spd = 50
function move(a,dt)
  if gx.keyboard.isDown("right") then
    a.x = a.x + spd * dt
  
  elseif gx.keyboard.isDown("left") then
    a.x = a.x - spd *dt
  
  elseif gx.keyboard.isDown("up") then 
    a.y = a.y - spd * dt
  
  elseif gx.keyboard.isDown("down") then
    a.y = a.y + spd * dt
  end 
end 
end 

function gx.update(dt)
  move(en1,dt)

end 

function gx.draw()
  local mode 
  if checkForCollisions(en1,en2) then 
    mode = "fill"
  else
    mode = "line"
  end 
  gx.graphics.rectangle(mode,en1.x,en1.y,20,20)
  gx.graphics.rectangle(mode,en2.x,en2.y,20,20)
end 