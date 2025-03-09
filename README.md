# Pokemon Explorer

Welcome to the **Pokemon Explorer** project! This is small application that allows you to explore information about various Pokémon. You can view details about each Pokémon, including their appearances, types, and stats. All data utilized come from the [PokeApi](https://pokeapi.co/).
The app is built for both Android and iOS platforms for smartphone and tablet interfaces.

## Features

### Basic Features

- Type Selection + Search: Users can choose a Pokémon type from the following options: Fire, Water, Grass, Electric, Dragon, Psychic, Ghost, Dark, Steel, and Fairy. Additionally, users can search for Pokémon by name within the selected type.
- Display Pokémon: Display a list of Pokémon that belong to the selected type. The initial list should show only the first 10 Pokémon, with an option to load more Pokémon by fetching additional results from the API.
- Pokémon Details: Provide detailed information for each Pokémon, including its name, image, and it’s basic stats: HP, Attack and Defense.

### Design Decisions

- Responsive UI for both Tablet and Smartphone interfaces
- Supports both iOS and Android platforms
- The *load more* feature in the Pokémon list is made with infinite scrolling that fetches new entries when the users scrolls down and also fills the remaining empty page if more entries are available.
- The user can also navigate without selecting any type (search by keyword is not supported)
- Pokémon stats are shown with bars representing their power levels. The bars are filled based on the stat values, and their color varies according to the strength of the stat (e.g., green for high power, yellow for average, and red for low power).
- Appropriate error messages are displayed based on the data status and internet connectivity.
- Pokemon Details page is made deep linking compatible --gets the data by using only pokemon name (in case of feature addition).


## Application Appearance
<p float="left">
<img src="https://github.com/L4Limbo/pokemon_explorer/blob/main/screenshots/Simulator%20Screenshot%20-%20iPad%20Pro%2013-inch%20(M4)%20-%202025-03-09%20at%2020.58.44.png" alt="" width="267" height="200" />
<img src="https://github.com/L4Limbo/pokemon_explorer/blob/main/screenshots/Simulator%20Screenshot%20-%20iPhone%2016%20Plus%20-%202025-03-09%20at%2020.58.56.png" alt="" width="92" height="200" />
<img src="https://github.com/L4Limbo/pokemon_explorer/blob/main/screenshots/Simulator%20Screenshot%20-%20iPhone%2016%20Plus%20-%202025-03-09%20at%2020.59.06.png" alt="" width="92" height="200" />
<img src="https://github.com/L4Limbo/pokemon_explorer/blob/main/screenshots/Simulator%20Screenshot%20-%20iPhone%2016%20Plus%20-%202025-03-09%20at%2020.59.32.png" alt="" width="92" height="200" />
</p>


## Installation

To run this project locally, follow these steps:

### Prerequisites

- Flutter SDK (3.24.5)
- Dart (3.5.4)
- DevTools (2.37.3)
- An IDE (e.g., Visual Studio Code or Android Studio)

### Clone the repository

```bash
git clone https://github.com/L4Limbo/pokemon_explorer.git
```

### Navigate to project and Install dependencies

```
cd pokemon_explorer
flutter pub get
```

### Run the App

```
flutter run # and then select a real device or an emulator
```


## Architecture

### Overview

The application was built following a `clean architecture-like` aproach to provide a scalable skeleton for future improvements. It is seperated in following parts:
1. Data Layer: This is the part that handles data-related operations. It consists of the following parts:
	- Data sources: In the current project there are only remote data sources utilized via HTTP Requests (Api Service), but offline can be supported also. The data sources convert the results of the API Service communication to Data Transfer Objects (DTOs).
	- DTOs: This is the depiction of the data needs the app that later will be converted to models (domain layer part) that will be used to draw the UI.
	- Repository Implementations: These are implementation of abstract Repositories that lay in the domain layer. Repositories can utilize one or more data sources and combine data to provide models to the presentation layer.
2. Domain Layer: This part holds the business logic of the app. It consists of the following parts:
	- Models: This is the picture of data that the application uses.
	- Repositories: Abstract classes that need to be implemented to connect domain with the data layer
	- Use cases: Use case are the glue between domain and presentation layer. They can utilize one or more Repositories.
3. Presentation Layer: This is the super star of the app. It consists of the following parts:
	- States: This is the type of data the UI needs to be drawn. They can modify themselves according to the UI interaction.
	- View Models: These are the controllers of the UI. They have two jobs. The first one is to provide the state needed to the widgets of the app. The latter to communicate with the domain layer via use cases or repositories and modify the state accordingly.
	- Widgets/Pages: (Last but not least) These are the parts that paint the UI of the application and connect the user with the bellow system through user interactions (Buttons, Gestures etc).

#### Extra
There are also files that act as helpers the above architecture like helpers to convert data (e.g. String extensions) and to *store* constant variables of the app.

#### Config
The app configuration consists of the theme, the routes and the application environment where useful variables are set. Config should be modular and open to modification for more complex ones, like white-label apps (via flavors in Flutter).

### Folder Structure

```
pokemon_explorer/
├── android/                 # Contains Android related files
├── ios/                     # Contains iOS related files
├── assets/                  # Contains images, icons, and other static resources
│   ├── images/              # Logo images
│   └── icons/               # App icons
├── lib/                     # Contains all the Dart code for the app
│   ├── config/              # Basic app configuration (routes, theme, env)
│   ├── data/                # Data Layer (Data Sources, DTOs, Repository Imp)
│   ├── domain/              # Domain Layer (Models, Repositories/Services, Usecases)
│   ├── presentation/        # UI Layer with State Management
│   ├── utils/               # Helper functions like variable type extensions and constants
└── pubspec.yaml             # Project configuration and dependencies

```


## Technology Stack

The application is written in Flutter that supports cross platform development

### Important Packages

- **Routing**:  
  - [go_router](https://pub.dev/packages/go_router): A declarative routing package that simplifies navigation in your Flutter app. It supports deep linking, route guards, and more.
- **State Management**:  
  - [flutter_riverpod](https://pub.dev/packages/flutter_riverpod): A minimal state management solution for Flutter with support for code generation. Riverpod is flexible and helps manage state efficiently across your app.
- **Code Generation**:  
  - [freezed](https://pub.dev/packages/freezed): A package that generates immutable data classes with built-in equality, copy methods, and JSON serialization. It helps avoid boilerplate code in your app.
- **HTTP Requests**:  
  - [dio](https://pub.dev/packages/dio): A powerful HTTP client for Flutter, supporting features like interceptors, request cancellation, file downloading, and custom timeout settings.
- **Infinite Scrolling**:  
  - [infinite_scroll_pagination](https://pub.dev/packages/infinite_scroll_pagination): A package that helps implement infinite scrolling with pagination, providing a smooth user experience when loading large datasets.

