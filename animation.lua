function gx.load()
 gx.window.setMode(320,240)
 monsterIMG = gx.graphics.newImage("img/monster_1_24.png") -- 8 frames 24x24px
 frames = {}
 local frW = 24
 local frH = 24
 for i = 0, 1 do 
    for j = 0, 3 do 
      table.insert(frames,gx.graphics.newQuad(j*frW,i*frH,frW,frH,monsterIMG:getWidth(),monsterIMG:getHeight()))
      --if #frames == maxframes then
      --  break
      --end 
    end 
  end 
 currentFrame = 1
 maxFrames = 9
end 


function gx.update(dt)
  currentFrame = currentFrame + dt
  if currentFrame >= maxFrames then
      currentFrame = 1
  end 
end 

function gx.draw()
  gx.graphics.draw(monsterIMG,frames[math.floor(currentFrame)],100,100)
end 