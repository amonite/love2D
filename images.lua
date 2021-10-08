function gx.load()
  gx.window.setMode(320,240)  
  -- load image 
  sheepIMG = gx.graphics.newImage("img/sheep1.png")
  --get img dimension
  imgW = sheepIMG:getWidth()
  imgH = sheepIMG:getHeight()
  --set background color (rgb)
  gx.graphics.setBackgroundColor(0,0,200)
end 

function gx.update()

end 

function gx.draw()
  gx.graphics.draw(sheepIMG,10,10)
  --(r/255,g/255,b/255,alpha)
  gx.graphics.setColor(1,0,0,0.5)
  gx.graphics.draw(sheepIMG,160,120)
  gx.graphics.setColor(1,1,1,1)
  -- optional args:
  -- rotation,scaleX,scaleY,originX,originY,
  -- kx,ky (see API)

end 