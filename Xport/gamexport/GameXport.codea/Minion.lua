Minion = class()

function Minion:init()
    -- accept and set parameters here
    self.position = vec2(0,0)
    self.velocity = vec2(0,0)
    fc = fc
    md = md
    hiite = 0
    spr = spr
end

function Minion:jump(power)
    sound(DATA, "ZgBALRVMQEBAQEBAFrnDPSivoT3uMIM+WwBAf0BJQEBAQEBA")
    self.velocity = self.velocity + vec2(0,power)
end

function Minion:computeVelocity()
    gravity = vec2(Gravity.x, math.min(Gravity.y,-1)):normalize()
    gravity = gravity * 20
    friction = math.min(self.position.y, 1)
    return self.velocity + gravity * friction
end

function Minion:update()
    self.position = self.position + self:computeVelocity()
    
    -- Clamp y position
    self.position.y = math.max(self.position.y,0)
    
    -- Clamp x position
    self.position.x = math.max(self.position.x,-WIDTH/2)
    self.position.x = math.min(self.position.x,WIDTH/2)
  --  if self.position.x == -WIDTH/2 then
      --  self.position.x = self
    
    -- Dampen velocity
    self.velocity = self.velocity * .98
end

function Minion:isFalling()
    return self:computeVelocity().y < 0
end

function Minion:drawDead()
    if md == 1 then 
        if fc < 1500 then
            hiite = 1
            else hiite = 0
        end
        finalc = countc * 150
        if hiite == 1 and spr == 1 then
            tint(55, 55, 56, 255)
            fill(255,255,255,255)
            sprite("Dropbox:Purple-Monster2",minion.position.x,minion.position.y)
            font("AmericanTypewriter")
            fontSize(50)
            text("Score: "..fc.." + "..finalc.." = "..finalcoins,CENTER,HEIGHT/2 -20)
            font("AmericanTypewriter-Bold")
            fontSize(100)
            text("GAME OVER",CENTER,HEIGHT/2 + 50)
            font("AmericanTypewriter")
            fontSize(50)
            text("High Score: "..math.floor(highscore),CENTER, HEIGHT/2 - 70)
            font("Didot-Italic")
            fontSize(30)
            text("Tap to restart",CENTER,HEIGHT/2 + 200)
        end
        
        if hiite == 0 and spr == 1 then
            tint(55, 55, 56, 255)
            fill(255,255,255,255)
            sprite("Dropbox:Purple-Monster2",minion.position.x,minion.position.y)
            font("AmericanTypewriter")
            fontSize(50)
            text("Score: "..fc.." + "..finalc.." = "..finalcoins,CENTER,minion.position.y - 20)
            font("AmericanTypewriter-Bold")
            fontSize(100)
            text("GAME OVER",CENTER,minion.position.y+50)
            font("AmericanTypewriter")
            fontSize(50)
            text("High Score: "..math.floor(highscore),CENTER,minion.position.y - 70)
            font("Didot-Italic")
            fontSize(30)
            text("Tap to restart",CENTER,minion.position.y + 200)
        end
    
        if hiite == 1 and spr == 0 then
            tint(55, 55, 56, 255)
            fill(255,255,255,255)
            sprite("Dropbox:monster blue",minion.position.x,minion.position.y)
            font("AmericanTypewriter")
            fontSize(50)
            text("Score: "..fc.." + "..finalc.." = "..finalcoins,CENTER,HEIGHT/2 -20)
            font("AmericanTypewriter-Bold")
            fontSize(100)
            text("GAME OVER",CENTER,HEIGHT/2 + 50)
            font("AmericanTypewriter")
            fontSize(50)
            text("High Score: "..math.floor(highscore),CENTER, HEIGHT/2 - 70)
            font("Didot-Italic")
            fontSize(30)
            text("Tap to restart",CENTER,HEIGHT/2 + 200)
        end
        
        if hiite == 0 and spr == 0 then
            tint(55, 55, 56, 255)
            fill(255,255,255,255)
            sprite("Dropbox:monster blue",minion.position.x,minion.position.y)
            font("AmericanTypewriter")
            fontSize(50)
            text("Score: "..fc.." + "..finalc.." = "..finalcoins,CENTER,minion.position.y - 20)
            font("AmericanTypewriter-Bold")
            fontSize(100)
            text("GAME OVER",CENTER,minion.position.y+50)
            font("AmericanTypewriter")
            fontSize(50)
            text("High Score: "..math.floor(highscore),CENTER,minion.position.y - 70)
            font("Didot-Italic")
            fontSize(30)
            text("Tap to restart",CENTER,minion.position.y + 200)
        end
        
        if hiite == 1 and spr == 2 then
            tint(55, 55, 56, 255)
            fill(255,255,255,255)
            sprite("Dropbox:Orange-Monster2",minion.position.x,minion.position.y)
            font("AmericanTypewriter")
            fontSize(50)
            text("Score: "..fc.." + "..finalc.." = "..finalcoins,CENTER,HEIGHT/2 -20)
            font("AmericanTypewriter-Bold")
            fontSize(100)
            fill(0,0,0,255)
            text("GAME OVER",CENTER,HEIGHT/2 + 50)
            font("AmericanTypewriter")
            fontSize(50)
            
            text("High Score: "..math.floor(highscore),CENTER, HEIGHT/2 - 70)
            fill(0,0,0,255)
            font("Didot-Italic")
            fontSize(30)
            text("Tap to restart",CENTER,HEIGHT/2 + 200)
        end
        
        if hiite == 0 and spr == 2 then
            tint(55, 55, 56, 255)
            fill(255,255,255,255)
            sprite("Dropbox:Orange-Monster2",minion.position.x,minion.position.y)
            font("AmericanTypewriter")
            fontSize(50)
            text("Score: "..fc.." + "..finalc.." = "..finalcoins,CENTER,minion.position.y - 20)
            font("AmericanTypewriter-Bold")
            fontSize(100)
            text("GAME OVER",CENTER,minion.position.y+50)
            font("AmericanTypewriter")
            fontSize(50)
            text("High Score: "..math.floor(highscore),CENTER,minion.position.y - 70)
            font("Didot-Italic")
            fontSize(30)
            text("Tap to restart",CENTER,minion.position.y + 200)
        end
        
                if hiite == 1 and spr == 3 then
            tint(55, 55, 56, 255)
            fill(255,255,255,255)
            sprite("Dropbox:Green-Monster",minion.position.x,minion.position.y)
            font("AmericanTypewriter")
            fontSize(50)
            text("Score: "..fc.." + "..finalc.." = "..finalcoins,CENTER,HEIGHT/2 -20)
            font("AmericanTypewriter-Bold")
            fontSize(100)
            text("GAME OVER",CENTER,HEIGHT/2 + 50)
            font("AmericanTypewriter")
            fontSize(50)
            text("High Score: "..math.floor(highscore),CENTER, HEIGHT/2 - 70)
            font("Didot-Italic")
            fontSize(30)
            text("Tap to restart",CENTER,HEIGHT/2 + 200)
        end
        
        if hiite == 0 and spr == 3 then
            tint(55, 55, 56, 255)
            fill(255,255,255,255)
            sprite("Dropbox:Green-Monster",minion.position.x,minion.position.y)
            font("AmericanTypewriter")
            fontSize(50)
            text("Score: "..fc.." + "..finalc.." = "..finalcoins,CENTER,minion.position.y - 20)
            font("AmericanTypewriter-Bold")
            fontSize(100)
            text("GAME OVER",CENTER,minion.position.y+50)
            font("AmericanTypewriter")
            fontSize(50)
            text("High Score: "..math.floor(highscore),CENTER,minion.position.y - 70)
            font("Didot-Italic")
            fontSize(30)
            text("Tap to restart",CENTER,minion.position.y + 200)
        end
       
        -- For large characters
    
        
  if timerflag == 1 then            
    if hiite == 1 and spr == 1 then
            tint(55, 55, 56, 255)
            fill(255,255,255,255)
            sprite("Dropbox:Purple-Monster",minion.position.x,minion.position.y)
            font("AmericanTypewriter")
            fontSize(50)
            text("Score: "..fc.." + "..finalc.." = "..finalcoins,CENTER,HEIGHT/2 -20)
            font("AmericanTypewriter-Bold")
            fontSize(100)
            text("GAME OVER",CENTER,HEIGHT/2 + 50)
            font("AmericanTypewriter")
            fontSize(50)
            text("High Score: "..math.floor(highscore),CENTER, HEIGHT/2 - 70)
            font("Didot-Italic")
            fontSize(30)
            text("Tap to restart",CENTER,HEIGHT/2 + 200)
        end
        
        if hiite == 0 and spr == 1 then
            tint(55, 55, 56, 255)
            fill(255,255,255,255)
            sprite("Dropbox:Purple-Monster",minion.position.x,minion.position.y)
            font("AmericanTypewriter")
            fontSize(50)
            text("Score: "..fc.." + "..finalc.." = "..finalcoins,CENTER,minion.position.y - 20)
            font("AmericanTypewriter-Bold")
            fontSize(100)
            text("GAME OVER",CENTER,minion.position.y+50)
            font("AmericanTypewriter")
            fontSize(50)
            text("High Score: "..math.floor(highscore),CENTER,minion.position.y - 70)
            font("Didot-Italic")
            fontSize(30)
            text("Tap to restart",CENTER,minion.position.y + 200)
        end
    
        if hiite == 1 and spr == 0 then
            tint(55, 55, 56, 255)
            fill(255,255,255,255)
            sprite("Dropbox:Blue-Monster",minion.position.x,minion.position.y)
            font("AmericanTypewriter")
            fontSize(50)
            text("Score: "..fc.." + "..finalc.." = "..finalcoins,CENTER,HEIGHT/2 -20)
            font("AmericanTypewriter-Bold")
            fontSize(100)
            text("GAME OVER",CENTER,HEIGHT/2 + 50)
            font("AmericanTypewriter")
            fontSize(50)
            text("High Score: "..math.floor(highscore),CENTER, HEIGHT/2 - 70)
            font("Didot-Italic")
            fontSize(30)
            text("Tap to restart",CENTER,HEIGHT/2 + 200)
        end
        
        if hiite == 0 and spr == 0 then
            tint(55, 55, 56, 255)
            fill(255,255,255,255)
            sprite("Dropbox:Blue-Monster",minion.position.x,minion.position.y)
            font("AmericanTypewriter")
            fontSize(50)
            text("Score: "..fc.." + "..finalc.." = "..finalcoins,CENTER,minion.position.y - 20)
            font("AmericanTypewriter-Bold")
            fontSize(100)
            text("GAME OVER",CENTER,minion.position.y+50)
            font("AmericanTypewriter")
            fontSize(50)
            text("High Score: "..math.floor(highscore),CENTER,minion.position.y - 70)
            font("Didot-Italic")
            fontSize(30)
            text("Tap to restart",CENTER,minion.position.y + 200)
        end
        
        if hiite == 1 and spr == 2 then
            tint(55, 55, 56, 255)
            fill(255,255,255,255)
            sprite("Dropbox:Orange-Monster",minion.position.x,minion.position.y)
            font("AmericanTypewriter")
            fontSize(50)
            text("Score: "..fc.." + "..finalc.." = "..finalcoins,CENTER,HEIGHT/2 -20)
            font("AmericanTypewriter-Bold")
            fontSize(100)
            fill(0,0,0,255)
            text("GAME OVER",CENTER,HEIGHT/2 + 50)
            font("AmericanTypewriter")
            fontSize(50)
            
            text("High Score: "..math.floor(highscore),CENTER, HEIGHT/2 - 70)
            fill(0,0,0,255)
            font("Didot-Italic")
            fontSize(30)
            text("Tap to restart",CENTER,HEIGHT/2 + 200)
        end
        
        if hiite == 0 and spr == 2 then
            tint(55, 55, 56, 255)
            fill(255,255,255,255)
            sprite("Dropbox:Orange-Monster",minion.position.x,minion.position.y)
            font("AmericanTypewriter")
            fontSize(50)
            text("Score: "..fc.." + "..finalc.." = "..finalcoins,CENTER,minion.position.y - 20)
            font("AmericanTypewriter-Bold")
            fontSize(100)
            text("GAME OVER",CENTER,minion.position.y+50)
            font("AmericanTypewriter")
            fontSize(50)
            text("High Score: "..math.floor(highscore),CENTER,minion.position.y - 70)
            font("Didot-Italic")
            fontSize(30)
            text("Tap to restart",CENTER,minion.position.y + 200)
        end
        
                if hiite == 1 and spr == 3 then
            tint(55, 55, 56, 255)
            fill(255,255,255,255)
            sprite("Dropbox:Green-Monster (2)",minion.position.x,minion.position.y)
            font("AmericanTypewriter")
            fontSize(50)
            text("Score: "..fc.." + "..finalc.." = "..finalcoins,CENTER,HEIGHT/2 -20)
            font("AmericanTypewriter-Bold")
            fontSize(100)
            text("GAME OVER",CENTER,HEIGHT/2 + 50)
            font("AmericanTypewriter")
            fontSize(50)
            text("High Score: "..math.floor(highscore),CENTER, HEIGHT/2 - 70)
            font("Didot-Italic")
            fontSize(30)
            text("Tap to restart",CENTER,HEIGHT/2 + 200)
        end
        
        if hiite == 0 and spr == 3 then
            tint(55, 55, 56, 255)
            fill(255,255,255,255)
            sprite("Dropbox:Green-Monster (2)",minion.position.x,minion.position.y)
            font("AmericanTypewriter")
            fontSize(50)
            text("Score: "..fc.." + "..finalc.." = "..finalcoins,CENTER,minion.position.y - 20)
            font("AmericanTypewriter-Bold")
            fontSize(100)
            text("GAME OVER",CENTER,minion.position.y+50)
            font("AmericanTypewriter")
            fontSize(50)
            text("High Score: "..math.floor(highscore),CENTER,minion.position.y - 70)
            font("Didot-Italic")
            fontSize(30)
            text("Tap to restart",CENTER,minion.position.y + 200)
        end
     end
   end   
end
function Minion:draw()
    self:update()
    
    pushMatrix()
    
    translate(self.position.x, self.position.y)
if meg == 0 or timerflag == 0 then
    if spr == 0 then
        sprite("Dropbox:monster blue")
    end
    if spr == 1 then
       sprite("Dropbox:Purple-Monster2")
    end
    if spr == 2 then
        sprite("Dropbox:Orange-Monster2")
    end
    if spr == 3 then
        sprite("Dropbox:Green-Monster")
    end
end 

if meg == 1 and timerflag == 1 then
    if spr == 0 then
        sprite("Dropbox:Blue-Monster")
    end
    if spr == 1 then
       sprite("Dropbox:Purple-Monster")
    end
    if spr == 2 then
        sprite("Dropbox:Orange-Monster")
    end
    if spr == 3 then
        sprite("Dropbox:Green-Monster (2)")
    end
end
    popMatrix()  --JK ILY... whats up
end


