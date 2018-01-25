Score = class()

function Score:init(x)
    self.x = x
end

function Score:draw()
    if fc > 0 then
        sprite("Cargo Bot:Goal Area", -280, - camPos.y + 895,240)
    end
    
    if fc > 0 then 
        fontSize(45)
        fill(0,0,0,255)
        font("Georgia-Bold")
        text(fc, -280, - camPos.y + 895)
        fontSize(90)
        fontSize(45)
        fill(255,255,255,255)
        font("Georgia-Bold")
        text(fc, -280, - camPos.y + 900)
        fontSize(90)
    end 
       
    if startM == 1 then 
        countc = countp + countg
        sprite("Cargo Bot:Register Slot Last", 352, - camPos.y + 900)
        sprite("Cargo Bot:Register Slot", 300, - camPos.y + 900)
        sprite("Cargo Bot:Register Slot", 248, - camPos.y + 900)
      if countc >= 1000 then
        sprite("Cargo Bot:Star Filled", 300, - camPos.y + 940)
      end
    end
    if startM == 1 and countc < 1 then
        font("Noteworthy-Bold")
        fontSize(30)
        fill(0, 0, 0, 255)
        text(0,352,- camPos.y + 900)
    end
    ones = countc % 10
    if countc > 0 then
        font("Noteworthy-Bold")
        fontSize(30)
        fill(0, 0, 0, 255)
        text(ones,352,- camPos.y + 900)
    end
    tens = countc % 100
    tens = (tens - ones) / 10
    if countc >= 10 then
        font("Noteworthy-Bold")
        fontSize(30)
        fill(0, 0, 0, 255)
        text(tens,300,- camPos.y + 900)    
    end
    hundreds = countc % 1000
    hundreds = hundreds - (tens * 10) - ones
    hundreds = hundreds / 100
    if countc >= 100 then
        font("Noteworthy-Bold")
        fontSize(30)
        fill(0, 0, 0, 255)
        text(hundreds,248,- camPos.y + 900)    
    end
    thousands = countc % 10000
    thousands = thousands - (hundreds * 100) - (tens * 10) - ones
    thousands = thousands / 1000
    if countc >= 1000 then
        font("Noteworthy-Bold")
        fontSize(30)
        fill(0, 0, 0, 255)
        text(thousands,300,- camPos.y + 940)    
    end
end

function Score:touched(touch)
    -- Codea does not automatically call this method
end


