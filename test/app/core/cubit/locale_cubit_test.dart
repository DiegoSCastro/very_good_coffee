import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart';

void main() {
  group('LocaleCubit', () {
    late LocaleCubit localeCubit;

    setUp(() {
      localeCubit = LocaleCubit();
    });

    test('initial state should be Locale("en")', () {
      expect(localeCubit.state, const Locale('en'));
    });

    test('setLocale should emit new locale', () {
      const newLocale = Locale('pt');
      expectLater(localeCubit.stream, emits(newLocale));
      localeCubit.setLocale(newLocale);
    });

    test('setEnglish should emit Locale("en")', () {
      expectLater(localeCubit.stream, emits(const Locale('en')));
      localeCubit.setEnglish();
    });

    test('setPortuguese should emit Locale("pt")', () {
      expectLater(localeCubit.stream, emits(const Locale('pt')));
      localeCubit.setPortuguese();
    });

    test('setSpanish should emit Locale("es")', () {
      expectLater(localeCubit.stream, emits(const Locale('es')));
      localeCubit.setSpanish();
    });
  });
}
