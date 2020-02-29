module Samples.Blank where

import Graphics.Gloss

window :: Display
window = InWindow "Hello World" (640,480) (100,100)

picture :: Picture
picture = blank

run :: IO()
run = display window white picture
