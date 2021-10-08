-- test Graphics
-- LOAD
function gx.load()
  gx.window.setMode(320,240)
  Width=gx.graphics.getWidth()
  Height=gx.graphics.getHeight()
  x=Width/2
  y=Height/2
end
-- UPDATE
function gx.update(dt)--delta time (dt)
  x=x+50*dt
  if x>=Width+25 then
    x = -25
  end
end 
-- DRAW
function gx.draw(dt)
  gx.graphics.rectangle("line",x,y,25,25)
end 
