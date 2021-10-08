function gx.load()
  gx.window.setMode(320,240)
 
  Width = gx.graphics.getWidth()
  Height = gx.graphics.getHeight()
  Object = require "classic"
  
  function checkForCollisions(a,b)

  if a.x + a.w > b.x and a.x < b.x + b.w and a.y + a.h > b.y and a.y < b.y + b.h then 
    return true 
  else 
    return false
  end 

end 

  Enemy = Object:extend()
  EnemyList = {}
  EnemyTime = 0

  function Enemy:new(x,y,spd)
    self.x = x
    self.y = y
    self.w = 25
    self.h = 25
    self.spd = spd
    table.insert(EnemyList,self)
  end 

  function Enemy:draw()
    gx.graphics.rectangle("line",self.x,self.y,self.w,self.h)
  end 

  function Enemy:update(dt)
    self.y = self.y + self.spd * dt
  end 

  function CreateEnemies()
    EnemyTime = EnemyTime + 1
    if EnemyTime >= 1000 then
    for n=0,2 do
      enemy = Enemy(math.random(0,320),math.random(0,240)*-1,50)
    end 
    EnemyTime = 0
    end 
  end 

-- ====================================================
-- Bullet class
-- ====================================================
  Bullet = Object:extend()
  BulletList = {}

  function Bullet:new(x,y)
    self.x = x
    self.y = y
    self.w = 5
    self.h = 5
    self.spd = 100
    table.insert(BulletList,self)
  end 

  function Bullet:draw()
    gx.graphics.rectangle("line",self.x,self.y,self.w,self.h)

  end 

  function Bullet:update(dt)
    self.y = self.y - self.spd *dt
  end 

  -- ==================================================
  -- Player class
  -- ==================================================

  Player = Object:extend()
  BulletTime = 99

  function Player:new(x,y,spd)
    self.x = x
    self.y = y
    self.w = 20
    self.h = 20
    self.spd = spd 
  end 

  function Player:draw()
    gx.graphics.rectangle("line",self.x,self.y,self.w,self.h)
  end 

  function Player:move(dt)
    if gx.keyboard.isDown("right") then
      self.x = self.x + self.spd * dt
    elseif gx.keyboard.isDown("left") then
      self.x = self.x - self.spd *dt
    elseif gx.keyboard.isDown("up") then 
      self.y = self.y - self.spd * dt
    elseif gx.keyboard.isDown("down") then
      self.y = self.y + self.spd * dt
    end 

  end
  
  function Player:shoot()
    if gx.keyboard.isDown("space") then
      BulletTime = BulletTime + 1
      if BulletTime >= 100 then
        bullet = Bullet((self.x+self.w/2)-2.5,self.y)
        BulletTime = 0
      end
    else 
      BulletTime = 99 
    end
  end 

  player = Player(Width/2-10,Height-40,100)

end

function gx.update(dt)
  player:move(dt)
  player:shoot()
  CreateEnemies()
  for i,v in ipairs(EnemyList) do
      v:update(dt)
  end 
  for i,v in ipairs(BulletList) do
      v:update(dt)
  end 

  for i,en in ipairs(EnemyList) do
    for n,bul in ipairs(BulletList) do
      if checkForCollisions(en,bul) then
        table.remove(EnemyList,i)
      end 
    end 
  end 
end 

function gx.draw()
  gx.graphics.setColor(0,0,1)
  player:draw()
  gx.graphics.setColor(0,1,0)
  for i,v in ipairs(EnemyList) do
      v:draw()
  end 
  gx.graphics.setColor(1,1,0)
  for i,v in ipairs(BulletList) do 
      v:draw()
  end 
  gx.graphics.setColor(1,1,1)
end 