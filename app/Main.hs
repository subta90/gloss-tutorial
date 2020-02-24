module Main where

import Graphics.Gloss
import Graphics.Gloss.Data.ViewPort

windowWidth, windowHeight :: Num a => a
windowWidth = 1280
windowHeight = 960

window :: Display
window = InWindow "Hello World" (windowWidth, windowHeight) (100, 100)

boxWidth, boxHeight :: Float
boxWidth = 50
boxHeight = 50

data BoxState = BoxState
    { _x :: Float
    , _y :: Float 
    , _vx :: Float
    , _vy :: Float
    }

initialBox :: BoxState
initialBox = BoxState 0 0 150 150

drawBox :: BoxState -> Picture
drawBox box = translate (_x box) (_y box) $ rectangleSolid boxWidth boxHeight

nextBox :: ViewPort -> Float -> BoxState -> BoxState
nextBox vp dt box = 
    let
        x = _x box + _vx box * dt
        y = _y box + _vy box * dt

        isOverTop = y > (windowHeight - boxHeight) / 2
        isOverBottom = y < -(windowHeight - boxHeight) / 2
        isOverRight = x > (windowWidth - boxWidth) / 2
        isOverLeft = x < -(windowWidth - boxWidth) / 2

        vx = if isOverRight || isOverLeft then (-_vx box) else (_vx box)
        vy = if isOverTop   || isOverBottom then (-_vy box) else (_vy box)

    in BoxState x y vx vy

main :: IO ()
main = simulate window white 24 initialBox drawBox nextBox