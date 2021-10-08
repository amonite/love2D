-- To save the game data we need a table to store the information inside
-- when saving, a file named "savedata.txt" should be created in 
-- AppData\Roaming\LOVE\ on Windows. This is problematic here since we are
-- testing on the web without a typical install of LOVE2D !! 
-- refer to https://sheepolution.com/learn/book/21 for loading the savec data.
  lume = require "lume"
  gx.window.setMode(320,240)

  player = {
    x = 20,
    y = 20,
    size = 20,
    spd = 100
  }
  function collide(e1,e2)
    distance = math.sqrt( (e1.x - e2.x)^2 + (e1.y - e2.y)^2 )
    if distance < 20 then 
       return true 
    end
    --return distance < 20 
  end

  items = {}
      for i=1,15 do 
        table.insert(items,
          { x = gx.math.random(0,320),
            y = gx.math.random(0,240)

          }
        )
      end 
  function saveGame()
    data = {}
    data.player = {
      x = player.x,
      y = player.y,
  
    }
    data.items = {}
    for i,v in ipairs(items) do
        data.items[i] = {x = v.x, y = v.y}
    end 
    serialized = lume.serialize(data)
    print(serialized)
  end 

end 
function gx.keypressed(key)
  if key == "f1" then 
      saveGame()
  end 
end 



function gx.update(dt)
  if gx.keyboard.isDown("right") then
    player.x = player.x + player.spd * dt
  
  elseif gx.keyboard.isDown("left") then
    player.x = player.x - player.spd *dt
  
  elseif gx.keyboard.isDown("up") then 
    player.y = player.y - player.spd * dt
  
  elseif gx.keyboard.isDown("down") then
    player.y = player.y + player.spd * dt
  end 
  
  
  for i,v in ipairs(items) do
    if collide(player,v) then
     table.remove(items,i)
    end
  end 
  
end 

function gx.draw()
  gx.graphics.rectangle("line",player.x,player.y,player.size, player.size)
  for i,v in ipairs(items) do
      gx.graphics.rectangle("line",v.x,v.y,20,20)
  end 
end 