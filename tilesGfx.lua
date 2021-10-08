function gx.load()
  gx.window.setMode(320,240)
  tilesIMG = gx.graphics.newImage("img/tiles_24.png")
  frW = 24
  frH = 24
  frames = {}
  for i=0,2 do 
    table.insert(frames,gx.graphics.newQuad(i*frW,0,frW,frH,tilesIMG:getWidth(),tilesIMG:getHeight()))
  end 
  tilemap = {
        {1,1,1,1,1,1,1,1,1,1},
        {1,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,1,1,1,1,1},
        {1,0,0,1,0,0,0,1,0,1},
        {1,1,0,1,1,1,0,0,0,1},
        {1,0,0,0,0,0,0,1,0,1},
        {1,0,0,1,0,0,1,0,0,1},
        {1,1,0,0,0,1,1,0,0,1},
        {1,0,0,0,0,1,0,0,0,1},
        {1,2,2,2,2,1,1,1,1,1}
    }
  player = {
      img = gx.graphics.newImage("img/player1.png"),
      tileX = 2,
      tileY = 2

  }
end 

function isEmpty(x,y)
  return tilemap[y][x] == 0
end 

function gx.keypressed(key)
    local x = player.tileX
    local y = player.tileY

    if key == "left" then 
        x = x - 1
    elseif key == "right" then 
        x = x + 1
    elseif key == "up" then
        y = y - 1
    elseif key == "down" then 
        y = y + 1
    end 


    if isEmpty(x,y) then
      player.tileX = x
      player.tileY = y
    end 
end 

function gx.update()

end 

function gx.draw()
  for i, row in ipairs(tilemap) do
    for j, tile in ipairs(row) do 
      if tile ~= 0 then
          gx.graphics.draw(tilesIMG,frames[tile],j*frW-24,i*frH-24)
      end 
    end 
  end 
  gx.graphics.draw(player.img,player.tileX*frW-24,player.tileY*frH-24)
end 