Mega = class()


function Mega:init()
    
    self.position = vec2(0,0)
    
end

function Mega:isColliding(pos)
    
    if pos.x < (self.position.x + 32) and 
        pos.x > (self.position.x - 32) and
        pos.y < (self.position.y + 32) and
        pos.y > (self.position.y - 32) then
        return true
    end
    
    return false
    
end

function Mega:draw()
    
    pushStyle()
    pushMatrix()
    
    translate(self.position.x, self.position.y)
    sprite("Dropbox:Mushroom")
    
    popMatrix()
    popStyle()
    
end



