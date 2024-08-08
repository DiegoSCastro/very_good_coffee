import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/app/app.dart';

// Mock class
class MockGetRandomImageUsecase extends Mock implements GetRandomImageUsecase {}

void main() {
  late MockGetRandomImageUsecase mockGetRandomImageUsecase;
  late HomeCubit homeCubit;

  setUp(() {
    mockGetRandomImageUsecase = MockGetRandomImageUsecase();
    homeCubit = HomeCubit(getRandomImageUsecase: mockGetRandomImageUsecase);
  });

  test('initial state is HomeInitial', () {
    expect(homeCubit.state, isA<HomeInitial>());
  });
}
