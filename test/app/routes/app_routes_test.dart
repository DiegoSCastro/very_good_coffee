import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart';

void main() {
  group('AppRoutes', () {
    test('routes should have correct mappings', () {
      expect(AppRoutes.routes[AppRoutes.home], isA<Function>());
      expect(AppRoutes.routes[AppRoutes.home]!(null), isA<HomePage>());

      expect(AppRoutes.routes[AppRoutes.favorite], isA<Function>());
      expect(AppRoutes.routes[AppRoutes.favorite]!(null), isA<FavoritePage>());

      expect(AppRoutes.routes[AppRoutes.imageView], isA<Function>());
      expect(
        AppRoutes.routes[AppRoutes.imageView]!(null),
        isA<ImageViewPage>(),
      );
    });
  });
}
