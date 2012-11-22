
local love = love

module "game" do

  objs = {}
    
  tile = {}      -- meus tiles
    
end

function init ()
    
    for i=1, 50 do -- change 3 to the number of tile images minus 1.
        tile[i] = love.graphics.newImage("backgroundC.png")
        bg = {
            x = 0,
            y = 0,
            vx = 500
        }
    end
    
    cake = love.graphics.newImage "cake.jpg"
    objs[1] = {
        x = 400,
        y = 300,
        vx = 0,
        vy = 0,
        state = "not jumping"
        }
end





