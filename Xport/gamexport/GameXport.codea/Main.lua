-- Marcus Rieker

function setup()
    supportedOrientations(PORTRAIT)    
    clouds = CloudLevels()
    
    highscore = readLocalData("highscore")
    
    if not highscore then
        highscore = 0
    end
    
    spr = readLocalData("spr")
    oldscore = readLocalData("highscore")
    otherHigh = 0
    if not spr then
        spr = 0
    end
    sc = 0
    pause = 0
    fc = 0
    ExplosionFlag = 0
    countc = 0
    meg = 0
    minion = Minion()
    score = Score()
    ground = Ground()
    coins = Coin2()
    gems = Gem2()
    rockets = Rocket2()
    megas = Mega2()
    intro = Intro()
    minion.position = vec2(0, 0)
    md = 0
    mpy = minion.position.y
    generateObjects = 0
    startM = 0
    startElse = 0
    spchoice = 0
    w = WIDTH/2 
    timer = 0
    timerflag = 0
    introtimer = 0
    its = 0
end

function draw()
    if fc > 50 then
        generateObjects = 1
    end
    
    --intro sequence
    intro:draw()
    
    displayMode(FULLSCREEN_NO_BUTTONS)
    if minion.position.y == 0 and startM == 0 and its == 1 then
        sprite("Cargo Bot:Level Select Frame",WIDTH/2,500,130,80)
        sprite("Cargo Bot:Dialogue Box",WIDTH/2,800,730,200)
        fontSize(150)
        font("MarkerFelt-Thin")
        fill(255, 255, 255, 255)
        text("HOP ALONG",WIDTH/2,800)
        font("AmericanTypewriter")
        fontSize(50)
        text("High Score: "..math.floor(highscore),WIDTH/2,600)
        fill(255, 255, 255, 255)
        fontSize(30)
        font("HelveticaNeue-Italic")
        fill(0, 0, 0, 255)
        text("START",WIDTH/2,500)
        fill(255, 255, 255, 255)
        text("START",WIDTH/2 -2,498)
    if spr == 0 then 
        sprite("Dropbox:monster blue",WIDTH/2,144)
    end
    if spr == 1 then
        sprite("Dropbox:Purple-Monster2",WIDTH/2,144) 
    end
    if spr == 2 then
        sprite("Dropbox:Orange-Monster2", WIDTH/2, 144)
    end
    if spr == 3 then
        sprite("Dropbox:Green-Monster", WIDTH/2, 144)
    end
    end
    
    -- Center the camera on the Minion
    camPos = vec2(WIDTH/2, 
                  math.min(HEIGHT/2 - minion.position.y, 140))    
    translate(camPos.x,camPos.y)
    
    -- Draw ground
    if its == 1 then
    ground:make()
    end
    -- Draw Hint for character selection
    if startM == 0 and its == 1 then
        fontSize(20)
        font("HoeflerText-Regular")
        fill(255, 255, 255, 255)
        text("(Tap character",CENTER,300)
        text("to change it)",CENTER + 5,280)
    end
    -- Draw pause
    if pause == 1 and startM == 1 and md == 0 then
        fontSize(90)
        text("paused", -100, -camPos.y + 650)
        fontSize(60)
        font("Arial")
        text("Resume?", 100, -camPos.y + 500)
    end
    if pause == 0 and startM == 1 and md == 0 then
        sprite("Dropbox:Pause2", 332, -camPos.y + 40)
    end
    
    if md == 0 and startM == 1 and pause == 0 then
        clouds:update(camPos) 
        clouds:draw()
        minion:draw()
      if generateObjects == 1 then
        coins:update(camPos)
        coins:draw()
        gems:update(camPos)
        gems:draw()
        rockets:update(camPos)
        rockets:draw()
        megas:update(camPos)
        megas:draw()
      end
        if minion.position.y > fc then 
            fc = math.floor(minion.position.y) 
        end
        minionY = 400 + minion.position.y   
     end       
    if minion.position.y < fc - 1000 then
        md = 1
    end
    if md == 0 then
        score:draw()
    end
    finalcoins = fc + countc * 150
    if md == 1 then
        otherHigh = finalcoins
        Minion:drawDead()
    end
    
    if fc > highscore then
        highscore = fc
        saveLocalData("highscore",highscore)
    end
    
    if otherHigh > highscore then
        saveLocalData("highscore", otherHigh)
    end
    
    if clouds:isColliding(minion.position) and
       minion:isFalling() then
        minion:jump((35))
    end
    
    if ground:isColliding(minion.position) and
       minion:isFalling() then
        minion:jump((40))
    end
    
    if coins:isColliding(minion.position) then
        sound(SOUND_PICKUP, 44736)
        coins:collect(minion.position)
    end
    
    if gems:isColliding(minion.position) then
        sound(DATA, "ZgBAWQlAQEBAQEBAH7SyPcK++z7vV2Q+RgBAf0BAQEBAQEBA")
        gems:collect(minion.position)
    end
    
    if rockets:isColliding(minion.position) then
        ExplosionFlag = 1
        sound(DATA, "ZgNAFABSQEBASE5AuJwrPksmOj+pabM+YABAf0BAQF84aEBA")
        rockets:collect(minion.position)
        minion:jump((200))
    end
    
    if megas:isColliding(minion.position) then
        meg = 1
        megas:collect(minion.position)
        timerflag = 1
    end
    if timerflag == 1 then
        if timer < 5 then
            timer = timer + .01
        end
        if timer > 5 then
            timer = 0
            timerflag = 0
        end
    end
end
function touched(touch)
    --print(touch)
    if touch.tapCount == 1 and introtimer < 900 then
        endloadintro = 1
    end
    if startcs == 1 then
      if touch.tapCount == 1 and its == 0 and startM == 0 and touch.state == 0 and 
        touch.y < 380 and touch.y > 280 and touch.x < 180 and touch.x > 60 then
            spr = 0
            its = 1
      end
      if touch.tapCount == 1 and its == 0 and startM == 0 and touch.state == 0 and 
        touch.y < 380 and touch.y > 280 and touch.x < 340 and touch.x > 240 then
            spr = 1
            its = 1
      end
      if touch.tapCount == 1 and its == 0 and startM == 0 and touch.state == 0 and 
        touch.y < 380 and touch.y > 280 and touch.x < 480 and touch.x > 380 then
            spr = 2
            its = 1
      end
      if touch.tapCount == 1 and its == 0 and startM == 0 and touch.state == 0 and 
        touch.y < 380 and touch.y > 280 and touch.x < 660 and touch.x > 540 then
            spr = 3
            its = 1
      end
    end
    -- Pause 
    if touch.tapCount == 1 and touch.state == 0 and startM == 1 and touch.x < 750
        and touch.x > 650 and touch.y > 0 and touch.y < 60 then
            if pause == 0 then
                pause = 1
            end
    end
    if touch.tapCount == 1 and touch.state == 0 and startM == 1 and touch.x < 600
        and touch.x > 350 and touch.y > 400 and touch.y < 550 then
            if pause == 1 then
                pause = 0
            end
    end
    if touch.tapCount == 1 and its == 1 and touch.y >= 450 
        and touch.y <= 550 and startM == 0 then
        minion:jump(45)
        startM = 1
    end
    if md == 1 and touch.tapCount == 1 then
        tint(255,255,255,255)
        setup(restart)
        draw(restart)
        countc = 0
        countg = 0 
        countp = 0
    end
end