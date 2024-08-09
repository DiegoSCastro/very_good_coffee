# Very Good Coffee

![Gravação de Tela 2024-08-08 às 22 09 55](https://github.com/user-attachments/assets/d42199e4-9bab-4304-a60e-3c29c414694f)

This project is a Flutter application which gives the user the ability to save their favorite coffee pictures. 

API: https://coffee.alexflipnote.dev


### Run Instructions:

This application was created using Flutter version 3.24.0. To run it, you need to have Flutter version 3.0.0 or higher and Dart version 3.5 or higher installed.

Clone this repository to your local machine. Make sure you have the Flutter SDK installed on your machine.


Open the project and run the command:
flutter pub get

To generate strings locally(pub get should do that automatically)
flutter gen-l10n --arb-dir="lib/l10n/arb"

Run automated tests using the command:
flutter test

Run the app as a user:
If you want to test it as an end user or QA, download and install the file below on an Android device.

Download the file - https://drive.google.com/file/d/177Ir0cJAtzJKbRTWs36hS8TJhS6GwzKN/view?usp=sharing

### Implemented Features:

Home: where you can change the language, view a photo related to coffee, add or remove from favorites and navigate to the favorites screen.
It is also possible to change the photo that is currently displayed.

Favorites: there is an icon that activates a banner explaining how to remove an item from the favorite.
A list of favorites is displayed, each item is an image that can be clicked to view in more detail or can be dragged to the left to remove after a confirmation message

Image View: where we can see details to drag and pinch to zoom. It is also possible to select the text with the image link to copy and paste into a browser

### Packages

Unit and Widget Testing: To ensure app quality, we've implemented unit and widget tests. We've used the flutter_test and mocktail libraries to create and execute automated tests. Currently, our project has a test coverage of over 50%.

Dependency Injection: Utilized dependency injection through the get_it package. This approach enhances the separation of dependencies, making the code more modular and facilitating testing.

Local Data Storage: Implemented the sqfLite package to store data locally, enabling efficient storage of relevant information.

State Management: To employ Flutter's state management to reactively update the user interface when data changes. We've used "Bloc/Cubit" to reflect these changes in the user interface.

Image Caching: The "cached_network_image" package is utilized to efficiently load and cache web images. This enhances app performance by displaying preloaded images.