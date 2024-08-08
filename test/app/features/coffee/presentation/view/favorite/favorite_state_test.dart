import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart';

void main() {
  group('FavoriteState', () {
    test('initial state is created correctly', () {
      final state = FavoriteState.initial();
      expect(state, isA<FavoriteInitial>());
    });

    test('loading state is created correctly', () {
      final state = FavoriteState.loading();
      expect(state, isA<FavoriteLoading>());
    });

    test('saved state is created correctly', () {
      final state = FavoriteState.saved();
      expect(state, isA<FavoriteSaved>());
    });

    test('success state is created correctly with coffeImages', () {
      final coffeeImages = [
        const CoffeeImage(id: '1', imageUrl: 'url1', bytes: [0]),
        const CoffeeImage(id: '2', imageUrl: 'url2', bytes: [0]),
      ];
      final state = FavoriteState.success(coffeImages: coffeeImages);
      expect(state, isA<FavoriteSuccess>());
      expect((state as FavoriteSuccess).coffeImages, coffeeImages);
    });

    test('error state is created correctly with errorMessage', () {
      const errorMessage = 'An error occurred';
      final state = FavoriteState.error(errorMessage: errorMessage);
      expect(state, isA<FavoriteError>());
      expect((state as FavoriteError).errorMessage, errorMessage);
    });
  });
}
