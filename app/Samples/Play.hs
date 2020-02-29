module Samples.Play where

import Graphics.Gloss

import Graphics.Gloss
import Graphics.Gloss.Data.ViewPort
import Graphics.Gloss.Interface.IO.Game

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
initialBox = BoxState 0 0 0 0

drawBox :: BoxState -> Picture
drawBox box = translate (_x box) (_y box) $ rectangleSolid boxWidth boxHeight

updateBox :: Event -> BoxState -> BoxState
updateBox (EventKey key ks _ _) box = updateBoxWithKey key ks box
updateBox (EventMotion _)       box = box
updateBox (EventResize _)       box = box

up, down, right, left :: BoxState -> BoxState
up box = box { _vy = _vy box + 300 }
down box = box { _vy = _vy box - 300 }
right box = box { _vx = _vx box + 300 }
left box = box { _vx = _vx box - 300 } 

updateBoxWithKey :: Key -> KeyState -> BoxState -> BoxState
updateBoxWithKey (SpecialKey KeyUp) ks = if ks == Down then up else down
updateBoxWithKey (SpecialKey KeyDown) ks = if ks == Down then down else up
updateBoxWithKey (SpecialKey KeyRight) ks = if ks == Down then right else left
updateBoxWithKey (SpecialKey KeyLeft) ks = if ks == Down then left else right
updateBoxWithKey (Char 'w') ks = if ks == Down then up else down
updateBoxWithKey (Char 's') ks = if ks == Down then down else up
updateBoxWithKey (Char 'd') ks = if ks == Down then right else left
updateBoxWithKey (Char 'a') ks = if ks == Down then left else right
updateBoxWithKey _ _ = id 

nextBox :: Float -> BoxState -> BoxState
nextBox dt box =
    let
        x = _x box + _vx box * dt
        y = _y box + _vy box * dt

    in box { _x = correctedX x, _y = correctedY y}

correctedX :: Float -> Float
correctedX x 
    | x > (windowWidth - boxWidth) / 2 = (windowWidth - boxWidth) / 2
    | x < -(windowWidth - boxWidth) / 2 = -(windowWidth - boxWidth) / 2
    | otherwise = x

correctedY :: Float -> Float
correctedY y 
    | y > (windowHeight - boxHeight) / 2 = (windowHeight - boxHeight) / 2
    | y < -(windowHeight - boxHeight) / 2 = -(windowHeight - boxHeight) / 2
    | otherwise = y

run :: IO()
run = play window white 24 initialBox drawBox updateBox nextBox