Ground = class()

function Ground:make()
    for i = 1,8 do
        sprite("Planet Cute:Stone Block",-WIDTH/2 -70 + 101*i, -60)
    end
    for i = 1,8 do
        sprite("Planet Cute:Stone Block",-WIDTH/2 -70 + 101*i, -141)
    end
    sprite("Planet Cute:SpeechBubble",-50,100,100,100)
    fontSize(15)
    fill(0,0,0,255)
    text("A Monster!!",-49,85)
    sprite("Small World:Store Large",-60,-36,100)
    sprite("Small World:Tree 1",70,-10,90)
    sprite("Small World:Watch Tower",210,-10,100)
    sprite("Small World:House",220,-70,100)
    sprite("Small World:House",82,-60,100)
    sprite("Small World:House",140,-35,100)
    sprite("Small World:House",160,-60,100)
    sprite("Small World:House",120,-90,100)
    sprite("Small World:Store",180,-95,100)
    sprite("Small World:House",10,-50,100)
    sprite("Small World:House",40,-90,100)
    sprite("Small World:House",40,-120,100)
    sprite("Small World:Court",-140,-10,100)
    sprite("Small World:Mine",-340,-10,100)
    sprite("Small World:House",-360,-80,100)
    sprite("Small World:House",-300,-70,100)
    sprite("Small World:House",-240,-20,100)
    sprite("Small World:House",-230,-50,100)
    sprite("Small World:Store",-240,-80,100)
    sprite("Small World:House",-170,-70,100)
    sprite("Small World:House",-100,-80,100)
    sprite("Small World:House",-30,-80,100)
    sprite("Small World:House",-380,-130,100)
    sprite("Small World:House",-310,-120,100)
    sprite("Small World:House",-240,-110,100)
    sprite("Small World:House",340,-30,100)
    sprite("Small World:Tree 2",330,-50,50)
    sprite("Small World:House",360,-80,100)
    sprite("Small World:House",270,-40,100)
    sprite("Small World:House",290,-70,100)
    sprite("Small World:Store Medium",300,-110,100)
    sprite("Small World:House",360,-130,100)
    sprite("Small World:House",230,-110,100)
    sprite("Small World:House",-130,-120,100)
    sprite("Small World:Windmill",-180,-120,100)
    sprite("Small World:House",-60,-120,100)
    sprite("Small World:Tree 1",-10,-110,50)
    sprite("Small World:House",10,-150,100)
    sprite("Small World:House",150,-130,100)
    sprite("Small World:House",260,-140,100)
    sprite("Small World:Mine Large",100,-120,100)
end

function Ground:isColliding(pos)
    if pos.y < 15 then
        return true
    end

    return false
end



