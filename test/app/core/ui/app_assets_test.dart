import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart';

void main() {
  group('AppAssets', () {
    test('logo should be a valid asset path', () {
      expect(AppAssets.logo, startsWith('assets/'));
    });

    test('usaFlag should be a valid asset path', () {
      expect(AppAssets.usaFlag, startsWith('assets/'));
    });

    test('brazilFlag should be a valid asset path', () {
      expect(AppAssets.brazilFlag, startsWith('assets/'));
    });

    test('spanishFlag should be a valid asset path', () {
      expect(AppAssets.spanishFlag, startsWith('assets/'));
    });
  });
}
