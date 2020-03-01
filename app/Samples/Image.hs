module Samples.Image where

import Graphics.Gloss
import Graphics.Gloss.Juicy

window :: Display
window = InWindow "Gloss Tutorial" (640, 480) (100, 100)

run :: IO()
run = do
    Just img <- loadJuicy "resources/images/sample.jpeg"
    display window white $ scale 0.5 0.5 img