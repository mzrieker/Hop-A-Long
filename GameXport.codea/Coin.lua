Coin = class()


function Coin:init()
    
    self.position = vec2(0,0)
    
end

function Coin:isColliding(pos)
    
    if pos.x < (self.position.x + 48) and 
        pos.x > (self.position.x - 48) and
        pos.y < (self.position.y + 48) and
        pos.y > (self.position.y - 48) then
        return true
    end
    
    return false
    
end

function Coin:draw()
    
    pushStyle()
    pushMatrix()
    
    translate(self.position.x, self.position.y)
    sprite("Dropbox:Money")
    
    popMatrix()
    popStyle()
    
end


