-- Classes 
-- Lua doesn't have classes so we need to add a piece of code if we want to use them.
-- The perfect language was blitzmax but it's dead now.:/

function gx.load()
  gx.window.setMode(320,240)
  -- include class code
  Object = require "classic"
  -- create class
  Entity = Object.extend(Object)
  -- constructor
  function Entity.new(self)
      self.num = math.random(1,500)
      self.name = "r2d"..self.num
  end 
  -- method 
  function Entity.update(self,dt)
    self.num = self.num + 1
  end 
  -- method 
  function Entity.draw(self)
    gx.graphics.print("Ent name : "..self.name..self.num,10,10)
  end 
  -- instances
  robot1 = Entity()
  robot2 = Entity()
  print(robot1.name,robot2.name)

  
 --other way: syntactic sugar
 -- create class 
 Player = Object.extend(Object)
 -- constructor 
 --lua turns this into Thing.new(self)
 function Player:new(name, x, y, vel)
    self.name = name
    self.x = x
    self.y = y
    self.vel = vel
 end 
 -- method 
 --lua turns this into Player.update(self,dt)
 function Player:update(dt)
  self.x = self.x + self.vel*dt
 end 
 -- method 
--lua turns this into Player.draw(self,dt)
 function Player:draw(dt)
    gx.graphics.rectangle("line",self.x,self.y,25,25)
 end 
 -- instances 
 p1 = Player("Mario",10,10,50)
 p2 = Player("Luigi",20,20,60)
  
end

function gx.update(dt)
  robot1.update(robot1,dt)
  p1:update(dt)
  p2:update(dt)
end 

function gx.draw(dt)
  robot1.draw(robot1)
  --gx.graphics.print(test)
  p1:draw()
  p2:draw()
end 