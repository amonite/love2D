function gx.load()
    gx.window.setMode(320,240)
    gx.graphics.setBackgroundColor(0,0,1)
    --tilemap = {1,0,0,1,1,0,0,1}
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
        {1,1,1,1,1,1,1,1,1,1}
    }
end 

function gx.update()

end 

function gx.draw()
  --for i,v in ipairs(tilemap) do 
  --  if v == 1 then 
  --    gx.graphics.rectangle("line",i*24,50,24,24)
  --  end 
  --end
  gx.graphics.setColor(0.5,0.25,0)
  for i=1, #tilemap do
    for j=1,#tilemap[i] do 
      if tilemap[i][j] == 1 then 
        gx.graphics.rectangle("fill",(j*32)-32,(i*24)-24,32,24)
      end 
    end 
  end  
  gx.graphics.setColor(1,1,1)
end 