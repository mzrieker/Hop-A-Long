Gem = class()


function Gem:init()
    
    self.position = vec2(0,0)
    
end

function Gem:isColliding(pos)
    
    if pos.x < (self.position.x + 64) and 
        pos.x > (self.position.x - 64) and
        pos.y < (self.position.y + 64) and
        pos.y > (self.position.y - 64) then
        return true
    end
    
    return false
    
end

function Gem:draw()
    
    pushStyle()
    pushMatrix()
    
    translate(self.position.x, self.position.y)
    sprite("Dropbox:Diamond")
    
    popMatrix()
    popStyle()
    
end



