display.setStatusBar(display.HiddenStatusBar) 
--------------

-- Background colour, calculate button and museam picture.
----------------
display.setDefault( "background", 0/255, 100/255, 200/255 )

local calculateButton = display.newImageRect( "./calculate.png", 300, 300 )
calculateButton.x = display.contentCenterX
calculateButton.y = 210
calculateButton.id = " calculateButton "

-- Text telling the user to enter their age and more text telling them to enter the day
----------------
local title1 = display.newText( "Type your age here: ", 160, 290, native.systemFont, 45 )
title1:setFillColor( 0 )
title1.y = 1070
title1.x = 200

local title2 = display.newText( "Type the day here: ", 160, 410, native.systemFont, 45 )
title2:setFillColor( 0 )
title2.y = 1190
title2.x = 200
-----------------

-- Text fields for the age and the date 
--------------
local myAgeTextfield = native.newTextField( display.contentCenterX, display.contentCenterY + 110, 300, 80 )
myAgeTextfield.id = " myAgeTextField"

local theDayTextfield = native.newTextField( display.contentCenterX, display.contentCenterY + 230, 300, 80 )
theDayTextfield.id = "the day TextField"
--------------

-- Text where it prints if they are eligible for a discount
----------------
local screenText = display.newText( "Are you eligible for a discount?", 160, 130, native.systemFont, 80 )
screenText.x = display.contentCenterX
screenText.y = 950
screenText:setFillColor( 0 )
----------------

-- Enter button touch event
local function calculateButtonTouch ( event )
	myAge = tonumber( myAgeTextfield.text )
	theDay = ( theDayTextfield.text )
-- If statement to determine how much the user should pay to get into the museam
	if ( myAge >= 12 and myAge <= 21) or ( theDay == "tuesday" or theDay == "thursday") then
		screenText.text = "You pay student pricing"
	elseif myAge <= 3 then
		screenText.text = "You pay infant pricing"
	else
		screenText.text = "You pay normal pricing"
	end
end

calculateButton :addEventListener( "touch", calculateButtonTouch )