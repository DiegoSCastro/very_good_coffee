# Very Good Coffee

![Gravação de Tela 2024-08-08 às 22 09 55](https://github.com/user-attachments/assets/22de6917-593a-4a09-a0a3-7095ee23f23c)

**Very Good Coffee** is a Flutter application that allows users to save their favorite coffee pictures.

API: https://coffee.alexflipnote.dev

### Run Instructions:

This application was developed using Flutter version 3.24.0. To run it, you need Flutter version 3.0.0 or higher and Dart version 3.5 or higher installed.

1. **Clone the Repository:**  
   Clone this repository to your local machine.

2. **Install Dependencies:**  
   Open the project and run the following command to install dependencies:  
   ```bash
   flutter pub get

3. **Generate Localization Strings:**  
   The following command will generate localized strings (although pub get should do this automatically):
   ```bash
   flutter gen-l10n --arb-dir="lib/l10n/arb"

4. **Run Tests:**  
   To run the automated tests, use:
   ```bash
   flutter test

5. **Run the App:**  
   To run the app on an Android device as an end user or QA tester, download and install the APK from the link below:
   https://drive.google.com/file/d/177Ir0cJAtzJKbRTWs36hS8TJhS6GwzKN/view?usp=sharing

### Features:

- **Home Screen:**  
  Allows you to change the language, view a coffee-related photo, add or remove it from favorites, and navigate to the favorites screen. You can also change the currently displayed photo.

- **Favorites Screen:**  
  Includes a banner with instructions on how to remove a favorite item. Displays a list of favorite images, each of which can be tapped to view in detail or dragged left to remove after confirming.

- **Image View:**  
  Provides details of the image, with options to drag, pinch to zoom, and select text to copy the image link for use in a browser.

### Packages Used:

- **Unit and Widget Testing:**  
  To ensure app quality, unit and widget tests have been implemented using the `flutter_test` and `mocktail` packages. The project currently has over 50% test coverage.

- **Dependency Injection:**  
  `get_it` is used for dependency injection, making the code more modular and easier to test.

- **Local Data Storage:**  
  The `sqfLite` package is used for efficient local data storage.

- **State Management:**  
  State management is handled using `Bloc/Cubit`, allowing the UI to reactively update with data changes.

- **Image Caching:**  
  `cached_network_image` is used for efficient loading and caching of web images, improving app performance by displaying preloaded images.

- **Connectivity:**  
  The app checks internet status using `connectivity_plus`.

- **Localization:**  
  Supports three languages using Flutter's localization features.

- **Architecture:**  
  Applied SOLID principles and Clean Architecture to ensure code maintainability, scalability, and testability.

