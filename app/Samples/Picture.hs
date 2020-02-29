module Samples.Picture where

import Graphics.Gloss

data PictureType = BlankType | PolygonType

window :: Display
window = InWindow "Hello World" (640,480) (100,100)

picture :: PictureType -> Picture
picture BlankType = blank
picture PolygonType = color black $ polygon [(0, 150), (150, 50), (100, -100), (-100, -100), (-150, 50)]

run :: PictureType -> IO()
run pictureType = display window white $ picture pictureType
