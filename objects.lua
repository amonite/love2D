function gx.load()
  gx.window.setMode(320,240)
  -- create a list of objects using a table as a list
  EntityList = {}
  function createEntity(x,y,w,h,s)
      Entity = {}
      Entity.x = x
      Entity.y = y
      Entity.w = w
      Entity.h = h
      Entity.s = s
      --insert objects in the list 
      table.insert(EntityList,Entity)
  end 
  --test creation
 -- createEntity(25,25,30,40,100)
 -- print(Entity.x)
  -- create multiple objects
  W = gx.graphics.getWidth()
  H = gx.graphics.getHeight()
  for n=1,10 do
    createEntity(math.random(1,W),math.random(1,H),10,10,0)
  end 
  -- create an object with properties:
  Rect= {}
  Rect.x = 100
  Rect.y = 100
  Rect.width = 25
  Rect.height = 10
end 

function gx.update(dt)

end 

function gx.draw()
  gx.graphics.print("Rect width: "..Rect.width,10,30)
  gx.graphics.rectangle("line",Rect.x,Rect.y,Rect.width,Rect.height)
  -- iterate through list and draw elements
  for i,v in ipairs(EntityList) do
    gx.graphics.rectangle("line",v.x,v.y,v.w,v.h)
  end 
end 