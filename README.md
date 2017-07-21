# WeatherForecastSwift

This app was built as a coding exercise the usage of Swift 3.0. and Viper Architecture. Using Viper my project is structured in modules (in this app we have only one), and in general modules represent a screen. Each module utilizes the following organization:
* Wireframe - Responsible for screen instantiation and presentation, and also to communicate with other Viper modules in case of Navigation intention. 
* View - Handles everything related to UI. Only View knows what UIKit is. Is responsible for notifying Presenter of user interactions events and (once we must have to work over Apple's MVC) View Controller life cycle events. 
* Presenter - It is where the main logic of a screen happens. It is responsible to handle the events received from View and ask it to present information, that for example can be result of a request to Interactor, or change behavior. Also is responsible for asking Wireframe to navigate to other modules.
* Interactor - Here is where all data related logic is. It is responsible for calling our API Client for data and return the data as Entity. Also could used for communication with Persistance like Core Data, NSUserDefaults or even KeyChain.
* Entities - It is the model object handled by Interactor. For a serie of advantages (or problems), one of the main Viper principes is to avoid manipulating non PONSO (Plain Old NSObjects) models, like ManagedObjects or Mantle, thats why Entities are important.
* Protocols - Viper follows many good principes like S.O.L.I.D, and of them is Dependency Inversion. It means that sub-modules should not depend on concretions, but on Abstractions. It brings a series of advantages like refactoring, business rules change, unit testing, etc. In this case, I grouped all the protocols for the module in a single file. 

Layout was built using XIB files instead Storyboards to make future reuse easier.

## Third Party technologies
This project utilizes Cocoapods as dependency manager. The third-party libs used are:
* Alamofire - for networking request
* Unbox - for JSON parse and object mapping
* NVActivityIndicatorView - To present activity indicators easily.
* SDWebImage - Used to load images async and manage presentation in reusable cells.

## Installation Steps
To run this project, you may need run Cocoapods install before. In case of you don't have Cocoapods installed in your computer, you can find the steps to do it [here](https://cocoapods.org).
Then, in a Terminal window navigate to project folder and execute the following command:

`pod install`

All dependencies should be installed.

## Roadmap for next iterations:
* Allow user to persist his favorite locations (Using Core data async).
* Show initial screen with a list of persisted locations, its current temperature and allow user interaction to remove locations.
* Show detailed weather for current location using GPS information.
* Use TabBar to control new screens presentation.
