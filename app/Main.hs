module Main where

import System.Environment (getArgs)
import Samples.Play as P
import Samples.Blank as B

main :: IO ()
main = do
    args <- getArgs
    if length args /= 1
        then
            putStrLn "Invalid Arguments."
    else do
        let firstArg = args !! 0
        if firstArg == "play"
            then 
                P.run
        else if firstArg == "blank"
            then
                B.run
        else
            putStrLn "No Sample."