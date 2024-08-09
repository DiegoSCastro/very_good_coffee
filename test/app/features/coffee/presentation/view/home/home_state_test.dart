import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart';

void main() {
  group('HomeState', () {
    test('should be HomeInitial when created with HomeState.initial()', () {
      final state = HomeState.initial();
      expect(state, isA<HomeInitial>());
    });

    test('should be HomeLoading when created with HomeState.loading()', () {
      final state = HomeState.loading();
      expect(state, isA<HomeLoading>());
    });

    test(
        'should be HomeSuccess with correct fileUrl when created with'
        ' HomeState.success()', () {
      const fileUrl = 'http://example.com/file.jpg';
      final state = HomeState.success(fileUrl: fileUrl);
      expect(state, isA<HomeSuccess>());
      expect((state as HomeSuccess).fileUrl, fileUrl);
    });

    test(
        'should be HomeError with correct errorMessage when created'
        ' with HomeState.error()', () {
      const errorMessage = 'An error occurred';
      final state = HomeState.error(errorMessage: errorMessage);
      expect(state, isA<HomeError>());
      expect((state as HomeError).errorMessage, errorMessage);
    });
  });
}
