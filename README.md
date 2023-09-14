# Star Wars Planets Viewer

This project is a simple iOS app that fetches and displays information about planets from the Star Wars API [swapi.dev](https://swapi.dev/). It allows users to view a list of planets, click on a planet to see its details, and even see sample images of each planet.

## Table of Contents
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Design Decisions](#design-decisions)
- [Dependencies](#dependencies)
- [Acknowledgments](#acknowledgments)

## Features
- Fetches and displays a list of planets from the Star Wars API.
- Allows users to click on a planet to see its details.
- Displays Planet Name, Climate, Orbital Period, and Gravity information.
- Displays sample images (optional feature).

## Requirements
- iOS 14.0+
- Xcode 12.0+
- Swift 5.3+

## Installation
1. Clone the repository: 
```bash
git clone https://github.com/SahanNagoda/StarWars
```
2. Open the project in Xcode:
```bash
cd StarWars
open StarWars.xcodeproj
```
3. Build and run the project using the iOS Simulator or a physical device.

## Usage
1. Upon launching the app, you will see a list of planets from the Star Wars universe.

2. Click on a planet to view its details, including Planet Name, Orbital Period, and Gravity.

3. If available, a sample image of the planet is displayed (if time permits - see acknowledgments).

## Project Structure
The project follows a structured directory layout to organize its components:

```
.
├── StarWars
│   ├── App
│   ├── Assets.xcassets
│   │   ├── AccentColor.colorset
│   │   └── AppIcon.appiconset
│   ├── Coordinators
│   ├── Helpers
│   ├── Models
│   ├── Preview Content
│   │   └── Preview Assets.xcassets
│   ├── Resource
│   ├── Services
│   │   ├── API
│   │   ├── Network
│   │   └── Providers
│   └── Views
│       ├── PlanetDetailView
│       │   └── CustomViews
│       └── PlanetsView
│           └── CustomViews
└── StarWars.xcodeproj
```
## Design Decisions
- The project uses SwiftUI for the user interface to provide a clean and maintainable codebase.
- A ViewModel (`PlanetsViewModel`) is used to handle data fetching and processing. It also manages the loading state.
- Navigation between the views is achieved using a coordinator pattern.

## Dependencies
- Alamofire: Used for networking tasks (optional feature).
- Lottie: Used to display loading animations (optional feature).
- Moya: Used for network requests.
- Combine: Used for handling asynchronous operations.

## Acknowledgments

- Functional reactive programming (FRP) is encouraged in the project, and you can explore using Combine for handling asynchronous operations.
- The project is designed with a focus on clean, maintainable code rather than a polished user interface. Further UI enhancements and optimizations can be made as needed.

Thank you for considering this project. If you have any questions or need further clarification, please feel free to reach out.
