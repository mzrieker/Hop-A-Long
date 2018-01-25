Cloud = class()


function Cloud:init()
    
    self.shapes = {}
    self.position = vec2(0,0)
    first = 0
    last = 0
    
   -- HTrack = fc * .0001
  --  HTrack = 10 / (10 + HTrack) 
    -- Generate random cloud
    numCircles = math.random(4,5)
    spacing = 30-- * HTrack
    
    for i = 1,numCircles do
        x = i * spacing - (((numCircles/2)*spacing) + spacing/2)
        y = (math.random() - 0.5) * 22
        rad = math.random(spacing, 2*spacing)
        table.insert(self.shapes, {x=x, y=y, r=rad})
        if i == 1 then
            first = rad
        elseif i == numCircles then
            last = rad
        end
    end
    self.width1 = (((numCircles - 1) * spacing)/2) + first
    self.width2 = (((numCircles - 1) * spacing)/2) + last
end

function Cloud:isColliding(pos)
    if timerflag == 0 then
        startp = self.position.x - self.width1 - 20
        endp = self.position.x + self.width2 + 20
    elseif timerflag == 1 then
        startp = self.position.x - self.width1 - 50
        endp = self.position.x + self.width2 + 50
    end
    if pos.x < endp and pos.x > startp and
       pos.y < (self.position.y + 30) and
       pos.y > (self.position.y + 10) then
        return true
    end
    
    return false
end

function Cloud:draw()
    pushStyle()
    pushMatrix()
    
    translate(self.position.x, self.position.y)
    
    noStroke()
    ellipseMode(RADIUS)
    fill(167, 190, 221, 255)
    
    for i,s in ipairs(self.shapes) do
        ellipse(s.x, s.y - 5, s.r)
    end
    
    fill(255, 255, 255, 255)
    
    for i,s in ipairs(self.shapes) do
        ellipse(s.x, s.y + 5, s.r)
    end
    
    popMatrix()
    popStyle()
end



