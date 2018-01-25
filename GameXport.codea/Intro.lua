Intro = class()

function Intro:init(x)
    -- you can accept and set parameters here
    self.x = x
    endintro = 0
    endloadintro = 0
end

function Intro:draw()
    if introtimer < 900 then
        introtimer = introtimer + 5
    end
    if introtimer >= 900 and endintro == 0 then
        introtimer = introtimer + 7
    end
    if its == 1 then
        background(103, 194, 228, 255)
        endintro = 1
    end
  if endintro == 0 then
    if introtimer < 900 then
        background(245, 244, 245, 255)
        sprite("Cargo Bot:Game Lower BG",WIDTH/2,HEIGHT/2,1000,1200)
        font("Copperplate-Light")
        fontSize(60)
        text("Welcome to Hop Along",WIDTH/2,introtimer)
        fontSize(30)
        text("The story of four baby monsters",WIDTH/2,introtimer - 60)
        text("who fell from their home in the sky,", WIDTH/2, introtimer - 100)
        text("and must now climb the clouds back home.", WIDTH/2, introtimer - 140)
        text("You control one of the four,", WIDTH/2, introtimer - 180)
        text("each has its own unique talent,", WIDTH/2, introtimer - 220)
        text("choose wisely and good luck!", WIDTH/2, introtimer - 260)
    end
    if introtimer >= 900 or endloadintro == 1 then
        background(245, 244, 245, 255)
        sprite("Cargo Bot:Game Lower BG",WIDTH/2,HEIGHT/2,1000,1200)
        font("Copperplate-Light")
        fontSize(60)
        text("Welcome to Hop Along",WIDTH/2, 900)
        fontSize(30)
        text("The story of four baby monsters",WIDTH/2, 835)
        text("who fell from their home in the sky,", WIDTH/2, 795)
        text("and must now climb the clouds back home.", WIDTH/2,755)
        text("You control one of the four,", WIDTH/2, 715)
        text("each has its own unique talent,", WIDTH/2, 675)
        text("choose wisely and good luck!", WIDTH/2, 635)
    end
    if introtimer < 1285 and endloadintro == 0 then
        text("Choose Your Character",introtimer - 900, HEIGHT/2)
    end
    if introtimer > 1285 or endloadintro == 1 then
        text("Choose Your Character", WIDTH/2, HEIGHT/2)
    end
    
    if introtimer < 1710 and endloadintro == 0 then
        text("Hyacintho", 100, introtimer - 1300)
    end
    if introtimer > 1710 or endloadintro == 1 then 
        text("Hyacintho", 100, HEIGHT/2 - 100)
    end
    
    if introtimer < 1860 and endloadintro == 0 then
        text("Purpura", 280, introtimer - 1450)
    end
    if introtimer > 1860 or endloadintro == 1 then
        text("Purpura", 280, HEIGHT/2 - 100)
    end
    
    if introtimer < 2010 and endloadintro == 0 then
        text("Aurantiaco", 460, introtimer - 1600)
    end
    if introtimer > 2010 or endloadintro == 1 then
        text("Aurantiaco", 460, HEIGHT/2 - 100)
    end
    
    if introtimer < 2160 and endloadintro == 0 then
        text("Viridis", 640, introtimer - 1750)
    end
    if introtimer > 2160 or endloadintro == 1 then
        text("Viridis", 640, HEIGHT/2 - 100)
    end
    if introtimer > 2170 or endloadintro == 1 then
        startcs = 1
    end
    if introtimer > 1720 or endloadintro == 1 then 
            sprite("Dropbox:monster blue", 100, HEIGHT/2 - 180)
            fontSize(20)
            text("Strong as an ox,", 100, HEIGHT/2 - 240)
            text("his jumps are", 100, HEIGHT/2 - 260)
            text("higher", 100, HEIGHT/2 - 280)
    end
    if introtimer > 1870 or endloadintro == 1 then
            sprite("Dropbox:Purple-Monster2", 280, HEIGHT/2 - 180)
            text("Endowed with", 280, HEIGHT/2 - 240)
            text("good luck -", 280, HEIGHT/2 - 260)
            text("her powerups", 280, HEIGHT/2 - 280)
            text("last longer", 280, HEIGHT/2 - 300)
    end
    if introtimer > 2020 or endloadintro == 1 then
            sprite("Dropbox:Orange-Monster2", 460, HEIGHT/2 - 180)
    end
    if introtimer > 2170 or endloadintro == 1 then
            sprite("Dropbox:Green-Monster", 640, HEIGHT/2 - 180)
    end
    
    if spr == 0 then
        tint(255,255,255,255)
    end
  end
end

function Intro:touched(touch)
    -- Codea does not automatically call this method
end
