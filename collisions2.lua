function gx.load()
  gx.window.setMode(320,240)

  Object = require "classic"
  -- Let's make a class 
  Entity = Object.extend(Object)

  function Entity:new(x,y,img_path)
    self.x = x
    self.y = y
    self.img = gx.graphics.newImage(img_path)
    self.w = self.img.getWidth()
    self.h = self.img.getHeight()
    self.frames = {}
    for i = 0,2 do
      table.insert(self.frames,gx.graphics.newQuad(i*24,0,24,24,self.img:getWidht(),self.img:getHeight()))
  end 
  end 

  function Entity:update()
    --update here
  end 
  

  function Entity:draw()
      gx.graphics.draw(self.img,self.x,self.y)
  end 

  function Entity:collide(e)
    return self.x + self.w > e.x 
    and self.x < e.x + e.w 
    and self.y + self.h > e.y 
    and self.y < e.y + e.h

  end 

  Player = Entity:extend() 

  function Player:new(x,y)
    Player.super.new(self,x,y,"img/player1.png") --I don't quite understand why self in param
  end 

  function Wall:new(x,y)
    Wall.super.new(self,x,y,"img/tiles24.png")
  end 

end 

function gx.update()

end 

function gx.draw()
    
end 