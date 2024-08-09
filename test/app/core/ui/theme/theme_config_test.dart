import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart';

void main() {
  group('ThemeConfig', () {
    test('theme should be a ThemeData with material3', () {
      expect(ThemeConfig.theme, isA<ThemeData>());
      expect(ThemeConfig.theme.useMaterial3, true);
    });
  });
}
