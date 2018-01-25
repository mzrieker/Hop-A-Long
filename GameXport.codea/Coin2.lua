Coin2 = class()

CULLPADDING = 300
countp = 0
countc = 0

function Coin2:init()
    self.coins = {}
    self.nextCoinHeight= 100
end

function Coin2:generateNextCoin()
    coin = Coin()
    coin.position = vec2(math.random(-400,400),self.nextCoinHeight)
    
    table.insert(self.coins, coin)
    
    self.nextCoinHeight = self.nextCoinHeight + math.random(150,300)
end

function Coin2:cullCoins(floor)
    for i,v in ipairs(self.coins) do
        if v.position.y < floor then
            table.remove(self.coins,i)
        end
    end
end

function Coin2:isColliding(pos)
    for i,v in ipairs(self.coins) do
        if v:isColliding(pos) then
            return true
        end
    end
    
    return false
end

function Coin2:update(cam)
    curHeight = -cam.y + HEIGHT + CULLPADDING
    
    if curHeight > self.nextCoinHeight then
        self:generateNextCoin()
    end
    
    self:cullCoins(-cam.y - CULLPADDING)
end

function Coin2:draw()
    
    for i,v in ipairs(self.coins) do
        v:draw()
    end
    
end

function Coin2:collect(pos)
    countp = 1 + countp
    for i,v in ipairs(self.coins) do
        if pos.x < (v.position.x + 48) and
            pos.x > (v.position.x - 48) and
            pos.y < (v.position.y + 48) and
            pos.y > (v.position.y - 48) then
            table.remove(self.coins,i)
        end
    end
end



