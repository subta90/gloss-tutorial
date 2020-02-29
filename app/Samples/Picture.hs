module Samples.Picture where

import Graphics.Gloss

data PictureType = BlankType | PolygonType | RectangleType | LineType | CircleType

window :: Display
window = InWindow "Gloss Tutorial" (640,480) (100,100)

picture :: PictureType -> Picture
picture BlankType = blank
picture PolygonType = color black $ polygon [(0, 150), (150, 50), (100, -100), (-100, -100), (-150, 50)]
picture RectangleType = rectangleSolid 200 150
picture LineType = line [(0, 150), (150, 50), (100, -100), (-100, -100), (-150, 50)]
picture CircleType = circle 100

run :: PictureType -> IO()
run pictureType = display window white $ picture pictureType
