Mega2 = class()

CULLPADDING = 300

function Mega2:init()
    self.megas = {}
    self.nextMegaHeight = 1000
end

function Mega2:generateNextMega()
    mega = Mega()
    mega.position = vec2(math.random(-800,800),self.nextMegaHeight)
    
    table.insert(self.megas, mega)
    
    self.nextMegaHeight = self.nextMegaHeight + math.random(3000,4000)
end

function Mega2:cullmegas(floor)
    for i,v in ipairs(self.megas) do
        if v.position.y < floor then
            table.remove(self.megas,i)
        end
    end
end

function Mega2:isColliding(pos)
    for i,v in ipairs(self.megas) do
        if v:isColliding(pos) then
            return true
        end
    end
    
    return false
end

function Mega2:update(cam)
    curHeight = -cam.y + HEIGHT + CULLPADDING
    
    if curHeight > self.nextMegaHeight then
        self:generateNextMega()
    end
    
    self:cullmegas(-cam.y - CULLPADDING)
end

function Mega2:draw()
    
    for i,v in ipairs(self.megas) do
        v:draw()
    end
    
end

function Mega2:collect(pos)
    for i,v in ipairs(self.megas) do
        if pos.x < (v.position.x + 32) and
            pos.x > (v.position.x - 32) and
            pos.y < (v.position.y + 32) and
            pos.y > (v.position.y - 32) then
            table.remove(self.megas,i)
        end
    end
end





