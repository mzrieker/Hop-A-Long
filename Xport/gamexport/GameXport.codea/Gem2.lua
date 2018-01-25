Gem2 = class()

CULLPADDING = 300
countg = 0

function Gem2:init()
    self.gems = {}
    self.nextGemHeight= 100
end

function Gem2:generateNextGem()
    gem = Gem()
    gem.position = vec2(math.random(-800,800),self.nextGemHeight)
    
    table.insert(self.gems, gem)
    
    self.nextGemHeight = self.nextGemHeight + math.random(1500,2000)
end

function Gem2:cullGems(floor)
    for i,v in ipairs(self.gems) do
        if v.position.y < floor then
            table.remove(self.gems,i)
        end
    end
end

function Gem2:isColliding(pos)
    for i,v in ipairs(self.gems) do
        if v:isColliding(pos) then
            return true
        end
    end
    
    return false
end

function Gem2:update(cam)
    curHeight = -cam.y + HEIGHT + CULLPADDING
    
    if curHeight > self.nextGemHeight then
        self:generateNextGem()
    end
    
    self:cullGems(-cam.y - CULLPADDING)
end

function Gem2:draw()
    
    for i,v in ipairs(self.gems) do
        v:draw()
    end
    
end

function Gem2:collect(pos)
    countg = 5 + countg
    for i,v in ipairs(self.gems) do
        if pos.x < (v.position.x + 64) and
            pos.x > (v.position.x - 64) and
            pos.y < (v.position.y + 64) and
            pos.y > (v.position.y - 64) then
            table.remove(self.gems,i)
        end
    end
end




