-- angles and distances
function gx.load()
  W = 320
  H = 240
  Distance = 0
  gx.window.setMode(W,H)
  -- create a circle
  circle = {}
    circle.x = W/2
    circle.y = H/2
    circle.radius = 15
    circle.spd = 100

  arrow = {}
    arrow.x = 100
    arrow.y = 100
    arrow.angle = 0
    arrow.speed = 100
    arrow.image = gx.graphics.newImage("img/arrow_right.png")
    arrow.originX = arrow.image:getWidth()/2
    arrow.originY = arrow.image:getHeight()/2

  function getDistance(x1,y1,x2,y2)
    vertical_distance = x1 - x2
    horyzontal_distance = y1 - y2
    local a = horyzontal_distance ^2
    local b = vertical_distance ^2
    c = a+b
    distance = math.sqrt(c)
    return distance
  end 
end 

function gx.update(dt)
  mx = gx.mouse.getX()
  my = gx.mouse.getY()
  arrow.angle = math.atan2(my-arrow.y,mx-arrow.x)
  _cos = math.cos(arrow.angle)
  _sin = math.sin(arrow.angle)
  arrow.x = arrow.x + arrow.speed * _cos * dt
  arrow.y = arrow.y + arrow.speed * _sin * dt

 -- angle = math.atan2(my-circle.y,mx-circle.x) -- in radians
  --_cos = math.cos(angle)
  --_sin = math.sin(angle)
  --circle.x = circle.x + circle.spd * _cos *dt
  --circle.y = circle.y + circle.spd *_sin *dt
  --Distance = getDistance(circle.x,circle.y,mx,my)
end 

function gx.draw()
  --gx.graphics.circle("line",circle.x,circle.y,circle.radius)
  --gx.graphics.print("angle : "..angle,5,H-20)
  --gx.graphics.print("dist : "..Distance,5,H-40)
  --gx.graphics.line(circle.x,circle.y,mx,my)
  --gx.graphics.line(circle.x,circle.y,mx,circle.y)
  --gx.graphics.line(mx,my,mx,circle.y)
  gx.graphics.draw(arrow.image,arrow.x,arrow.y,arrow.angle,1,1,originX,originY)
end 