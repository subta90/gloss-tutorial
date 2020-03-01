module Samples.Board where

import Graphics.Gloss

window :: Display
window = InWindow "Board" (640, 480) (100, 100)

board :: Picture
board = pictures
    [ rectangleWire 420 420
    , line [(-210, 70), (210, 70)]
    , line [(-210, -70), (210, -70)]
    , line [(-70, 210), (-70, -210)]
    , line [(70, 210), (70, -210)]
    ]

draw :: IO()
draw = display window white $ board 