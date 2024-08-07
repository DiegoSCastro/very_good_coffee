import 'package:very_good_coffee/app/app.dart';

sealed class AppRoutes {
  static const home = '/home';

  static final routes = {
    home: (context) => const HomePage(),
  };
}
