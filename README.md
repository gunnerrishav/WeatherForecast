## Features

- **MVVM Architecture**: Ensures a clean separation of concerns, making the codebase more manageable and testable.
- **SwiftUI**: Utilizes SwiftUI for declarative UI development, ensuring a reactive and swift interface.
- **Combine**: Handles asynchronous operations and data binding.


## Architecture

### MVVM (Model-View-ViewModel)

- **Model**: Represents the data structures of the Locationforecast API.
- **View**: SwiftUI views that render the UI.
- **ViewModel**: Manages the state and logic for each view, interacting with the Model and updating the View.

### SwiftUI

- Declarative UI components.
- Reactive interface that updates automatically based on the state managed by the ViewModel.

### Combine

- Publishers and Subscribers for handling asynchronous data streams.
- Data binding between ViewModel and View.

