
require "game"

local time = 0


function love.load()
  psy = love.graphics.newImage("psy.jpg")
   game.init()
   
   
end


function love.update(dt)
  
    for k,obj in pairs(game.objs) do
        obj.y = obj.y + obj.vy*dt
        obj.vy = obj.vy + 1000*dt
        
   
        if obj.y+game.cake:getHeight()/4 > 400 then
        
            obj.y = 400-game.cake:getHeight()/4
            obj.vy = 0
            obj.state = "not jumping"
        end
        
        game.bg.x = game.bg.x + game.bg.vx*dt
        
    end
end


function love.keypressed(key)   -- we do not need the unicode, so we can leave it out
    
    if key == "escape" then
      love.event.push("quit")   -- actually causes the app to quit
      
    elseif key == "up" and game.objs[1].state == "not jumping" then
        
        game.objs[1].vy = game.objs[1].vy - 600        
        game.objs[1].state = "jumping"
        
    elseif key == "a" and game.objs[1].state == "jumping" and game.objs[1].vy > 0 then
        for x=0, 1000 do
            game.objs[1].vy = 0;
        end
        game.objs[1].state = "not jumping"
        
    end
end

function love.keyreleased(key)
    
end

function love.draw()
  local g = love.graphics  
    g.push()
    g.translate(-game.bg.x, 0)
    for i, tileimg in ipairs(game.tile) do
        g.draw(tileimg, (i-1)*tileimg:getWidth(), 0)
        if i == 5 then            
            g.draw(psy, (i-1)*tileimg:getWidth(), 0)
        end
        if i == 6 then
            g.print("DAFUQ MAN?", (i-1)*tileimg:getWidth(), 150, 0, 5, 5)
        end
    end
    g.pop()
    
    for k,obj in pairs(game.objs) do
        g.draw(
            game.cake,
            obj.x, obj.y,
            0,
            0.5, 0.5,
            game.cake:getWidth()/2, game.cake:getHeight()/2
        )
        
        
end
    
  
end
