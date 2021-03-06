module Main where

import System.Environment (getArgs)
import Samples.Play as PLAY
import Samples.Picture as PIC
import Samples.Image as IMG
import Samples.Board as BOARD

runSample :: String -> IO()
runSample "play" = PLAY.run
runSample "blank" = PIC.run BlankType
runSample "polygon" = PIC.run PolygonType
runSample "rectangle" = PIC.run RectangleType
runSample "line" = PIC.run LineType
runSample "circle" = PIC.run CircleType
runSample "image" = IMG.run
runSample "board" = BOARD.draw
runSample _ = putStrLn "No Sample."

main :: IO ()
main = do
    args <- getArgs
    if length args < 1
        then
            putStrLn "No Arguments."
    else do
        let sampleType = args !! 0
        runSample sampleType