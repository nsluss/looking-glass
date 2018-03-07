module Main where
import LookingGlass
import Control.Concurrent (threadDelay)

main :: IO ()
main = do
  onStart
  putStrLn "sleeping thread"
  threadDelay 1000000000
  putStrLn "thread done sleeping, terminating program"

