Rocket2 = class()

CULLPADDING = 300

function Rocket2:init()
    self.rockets = {}
    self.nextRocketHeight= 1000
end

function Rocket2:generateNextRocket()
    rocket = Rocket()
    rocket.position = vec2(math.random(-800,800),self.nextRocketHeight)
    
    table.insert(self.rockets, rocket)
    
    self.nextRocketHeight = self.nextRocketHeight + math.random(8000,10000)
end

function Rocket2:cullrockets(floor)
    for i,v in ipairs(self.rockets) do
        if v.position.y < floor then
            table.remove(self.rockets,i)
        end
    end
end

function Rocket2:isColliding(pos)
    for i,v in ipairs(self.rockets) do
        if v:isColliding(pos) then
            return true
        end
    end
    
    return false
end

function Rocket2:update(cam)
    curHeight = -cam.y + HEIGHT + CULLPADDING
    
    if curHeight > self.nextRocketHeight then
        self:generateNextRocket()
    end
    
    self:cullrockets(-cam.y - CULLPADDING)
end

function Rocket2:draw()
    
    for i,v in ipairs(self.rockets) do
        v:draw()
    end
    
end

function Rocket2:collect(pos)
    for i,v in ipairs(self.rockets) do
        if pos.x < (v.position.x + 32) and
            pos.x > (v.position.x - 32) and
            pos.y < (v.position.y + 32) and
            pos.y > (v.position.y - 32) then
            table.remove(self.rockets,i)
        end
    end
end





