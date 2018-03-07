{-# LANGUAGE OverloadedStrings #-}
module Main where

import Reflex.Dom
import Control.Concurrent

main = do
  mainWidget $ el "div" $ text "Welcome to Reflex"
  threadDelay 10000000
