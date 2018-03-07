{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE JavaScriptFFI #-}
module LookingGlass where
import GHCJS.Foreign.Callback
import GHCJS.Types
import GHCJS.Prim
import JavaScript.Object

foreign import javascript interruptible
  "var app=require('electron').app;if(app.isReady()){$c('ready already fired');}else{app.on('ready',function(){$c('test')});}"
  app_on :: IO JSString

foreign import javascript unsafe
  "var BrowserWindow=require('electron').BrowserWindow;$r=new BrowserWindow($1);"
  new_browser :: Object -> IO BrowserWindow

foreign import javascript unsafe
  "$1.loadURL($2)"
  load_url :: BrowserWindow -> JSString -> IO ()

newtype BrowserWindow = BrowserWindow { getWindow :: Object }

spinUpWindow :: IO BrowserWindow
spinUpWindow = do
  obj <- create
  setProp "width" (toJSInt 500) obj
  setProp "height" (toJSInt 500) obj
  new_browser obj


spinUpWindow_ :: IO ()
spinUpWindow_ = spinUpWindow >> return ()

onStart :: IO ()
onStart = do
  ready_result <- app_on
  print ready_result
  mkApp


mkApp :: IO ()
mkApp = do
  win <- spinUpWindow
  load_url win "file:///Users/nsluss/Code/haskell/looking-glass/dist-ghcjs/build/x86_64-osx/ghcjs-0.2.1/looking-glass-app-front-end-0.1.0.0/c/looking-glass-app-front-end/build/looking-glass-app-front-end/looking-glass-app-front-end.jsexe/index.html"



