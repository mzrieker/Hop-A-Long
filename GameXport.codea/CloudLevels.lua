CloudLevels = class()

CULLPADDING = 300

function CloudLevels:init()
    self.clouds = {}
    self.nextCloudHeight = 100
end

function CloudLevels:generateNextCloud()
    time = 0
    cloud = Cloud()
    cloud.position = vec2(math.random(-WIDTH,-WIDTH/2),
                          self.nextCloudHeight)
    
    table.insert(self.clouds, cloud)
    
    self.nextCloudHeight = self.nextCloudHeight + math.random(150, 300)
    time = (math.abs(cloud.position.x) + WIDTH/2 + 50)/((WIDTH + WIDTH/2 + 50)/10)
tween( time, cloud.position, { x = WIDTH/2 + 100 }, {loop = tween.loop.forever } )
end

function CloudLevels:cullClouds(floor)
    for i,v in ipairs(self.clouds) do
        if v.position.y < floor then
            table.remove(self.clouds,i)
        end
    end
end

function CloudLevels:isColliding(pos)
    for i,v in ipairs(self.clouds) do
        if v:isColliding(pos) then
            return true
        end
    end
    
    return false
end

function CloudLevels:update(cam)
    curHeight = -cam.y + HEIGHT + CULLPADDING
    
    if curHeight + HEIGHT*3 > self.nextCloudHeight then
        self:generateNextCloud()
    end
    
    self:cullClouds(-cam.y - CULLPADDING)
end

function CloudLevels:draw()
    for i,v in ipairs(self.clouds) do
        v:draw()
    end
end

