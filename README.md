# Looking Glass

```
'But I don't want to go among mad people,' Alice remarked.
'Oh, you can't help that,' said the Cat: 'we're all mad here. I'm mad. You're mad.'
'How do you know I'm mad?' said Alice.
'You must be,' said the Cat, 'or you wouldn't have come here.'
```
## Modules
### lib-looking-glass
This contains electron bindings and abstractions around them. As of now the plan is  
to put code for both the main and render threads in this module. This is also where  
the reflex system wrapping electron will be defined. Electron bindings may be pulled  
out into a different library in the future.

### looking-glass-app
This is the main thread in the electron app.

### looking-glass-front-end
The application views.

## Notes
### design goals
  * allow interactive coding and hot loading of new front end user modules  
  * no dependency on custom javascript, the entire app should call out to the electron library via the FFI
### problems
  * The use of `threadDelay` is a dirty hack that will hopefully go away very soon.  
  * Electron has a fairly large API surface. It seems impractical to wrap all of it by hand. It may be possible to generate code from the electron [json docs](https://github.com/electron/electron/releases/tag/v1.8.2)

### prior art
  * [ghcjs-electron](https://github.com/taktoa/ghcjs-electron)  
  * [hyper-haskell](https://github.com/HeinrichApfelmus/hyper-haskell)

