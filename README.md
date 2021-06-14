# TheMovieDBApp
The Movie App Swift - iOS Application to handle The Mobie DB challenge using Xcode 12.4 and Swift 5.3

- [Architecture](#Architecture)
- [Folder Structure ](#location)
- [Targets](#targets)
- [Installation](#installation)

## Architecture
The app is using MVVM architecture, our main goal is to mantain everything under a simple but effective MVVM implementation.

- ### App Navigator
    The App Navigator (Coordinator) create `ViewControllers` with its `ViewModels` and perform the transition to the new `ViewController`. It's in charge of the flow navigation of the app.

- ### ViewModels
    `ViewModel` is the main component of this architecture pattern. `ViewModel` never knows what the view is or what the view does. This makes this architecture more testable and removes complexity from the view. 
    The `ViewModel` invokes changes in the `Model` and updates itself with the updated `Model`, and since we have a binding between the View and the `ViewModel`, the first is updated accordingly.

- ### Models
    `Model` refers either to a domain model, which represents simple data.

- ### Service Layer
    `Service layer` reside just above the `Networking Layer`, because your project specific API calls are handled here.

- ### Network Layer
    `Network Layer` is a general purpose component, which performs your physical API calls. 

Please consider this article if it is your first time using MVVM:
https://medium.com/@azamsharp/mvvm-in-ios-from-net-perspective-580eb7f4f129


## Folder Structure
**WIP:** 
In the root of the project we found this folder structure and files:
```
|-- actio
  |-- App
  |-- Assets
    |-- Assets.xcassets
  |-- Modules
    |-- Home
        |-- Views
          |-- Storyboards
          |-- Controllers
        |-- Models
        |-- ViewModels
      |-- MovieDetail
        |-- Views
          |-- Storyboards
          |-- Controllers
        |-- Models
        |-- ViewModels
  |-- Common
  |-- Extensions
  |-- Network
|-- SupportFiles
    |-- Info.plist
|-- Podfile
|-- Podfile.lock

```
Where all app code is hosted in `TheMovieDBApp` folder, all the settings files for xcode porject are hosted in `SupportFiles`. For each module of the app we use the folder structure show it in `Modules` folder

## Targets
**WIP:** We should define how many targets the app uses:

- **TheMovieDBApp**: Release version.

## Installation
This project use Xcode 12.4 and CocoaPods for dependencies, 

- **Clone Repo**:  `git clone git@github.com:devcarlos/TheMovieDBApp.git`
- **CD Directory**:  `cd TheMovieDBApp`
- **Install external frameworks**:  `pod install`
- **Open Project**:  `open TheMovieDBApp.xcworkspace`
- **Build and Execute**:  `build using Xcode CMD + R using a Simulator or Device`

Please consider review this github if it is your first time using Xcodegen:
https://github.com/yonaskolb/XcodeGen

