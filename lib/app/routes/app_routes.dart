import 'package:very_good_coffee/app/app.dart';

sealed class AppRoutes {
  static const home = '/home';
  static const favorite = '/favorite';
  static const imageView = '/image_view';

  static final routes = {
    home: (context) => const HomePage(),
    favorite: (context) => const FavoritePage(),
    imageView: (context) => const ImageViewPage(),
  };
}
