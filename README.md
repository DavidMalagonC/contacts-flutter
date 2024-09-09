
# Contacts Frontend

## Project Description

This project is a Contacts Frontend built using Flutter. It provides a user interface to interact with the Contacts API. Users can create, view, update, and delete contacts through a mobile-friendly UI. The frontend communicates with the Contacts API, which is built with Go and MySQL, via REST API calls.

### Design Decisions

- **Flutter**: Chosen for its cross-platform capabilities and modern UI components, allowing the app to run on both Android and iOS devices.
- **HTTP Integration**: The app uses `http` package to make requests to the backend API.
- **State Management with BLoC**: The app manages its state using the BLoC (Business Logic Component) pattern for separation of concerns and maintainable architecture.
- **Form Validation**: The app includes form validation for creating and updating contacts, ensuring that all required fields (name, email, phone) are filled out properly before submitting.

## Technologies Used

- **Flutter**: For building the UI and managing the app’s state.
- **BLoC**: For state management and event-driven architecture.
- **HTTP**: For making HTTP requests to the Contacts API.
- **Dart**: The primary language used in Flutter development.
- **GetIt**: Dependency injection for managing the lifecycle of services such as the BLoC.

## Execution Instructions

1. Clone the repository:

2. Navigate to the project directory:

   cd contacts-frontend

3. Install dependencies:

   flutter pub get

4. Run the app on an emulator or a physical device:

   flutter run

Make sure your backend API is running locally at http://localhost:8080, or update the API base URL in the Flutter code accordingly if you are running it on a different environment.

## State Management

This Flutter app uses the BLoC pattern for state management. The state of the contacts (list, loading, error) is managed by the `ContactsBloc`, which interacts with the API through use cases like adding, updating, and deleting contacts.

## Testing the Application

You can run unit tests to verify the functionality of the app using Flutter's built-in testing framework.

1. Run the tests:

   flutter test

This will execute any defined unit or widget tests for the application.

## API Integration

The app communicates with the backend Contacts API using the following REST API endpoints:

- **Get all contacts**: GET /contacts
- **Create a new contact**: POST /contacts
- **Update an existing contact**: PUT /contacts/{id}
- **Delete a contact**: DELETE /contacts/{id}

The base URL for the API is defined in the app’s HTTP service, and you can change it according to the backend deployment.