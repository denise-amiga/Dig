SuperStrict
'keep it small
Framework Brl.StandardIO
Import Brl.GLMax2D
Import "../../base.gfx.bitmapfont.bmx"



Graphics 640,480,0, 60
SetBlend(ALPHABLEND)

local cycleTime:Double = 0
local lastCycleTime:Double = -1
local direction:int = 1
local x:float = 0.0

local f:TBitmapFont = GetFontManager().Get("Default", 12)

While not KeyHit(KEY_ESCAPE)
	'compute cycle time
	if lastCycleTime = -1 then lastCycleTime = Millisecs()
	cycleTime = Millisecs() - lastCycleTime
	lastCycleTime = Millisecs()

	Cls

	SetColor 255,100,100
	SetAlpha 0.3
	DrawRect(150,100,200,200)
	Setalpha 1.0
	SetColor 255,255,255

	f.DrawBlock("Left Top", 150, 100, 200, 200, new TPoint.Init(0,0))
	f.DrawBlock("Right Top", 150, 100, 200, 200, new TPoint.Init(1,0))
	f.DrawBlock("Left Bottom", 150, 100, 200, 200, new TPoint.Init(0,1))
	f.DrawBlock("Right Bottom", 150, 100, 200, 200, new TPoint.Init(1,1))
	f.DrawBlock("Center", 150, 100, 200, 200, new TPoint.Init(0.5, 0.5))

	'calc current position of dynamic text thingie
	x :+ direction * (cycleTime / 1000.0) 'in ms
	if x >= 1.0 then direction = -1
	if x <= 0 then direction = 1

	f.DrawBlock("Bounce", 150, 100, 200, 200, new TPoint.Init(x, 0.3))

	Flip -1
Wend