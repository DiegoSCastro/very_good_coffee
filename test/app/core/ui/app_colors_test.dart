import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart'; // Adjust the import path as needed

void main() {
  test('AppColors should have correct color values', () {
    const expectedWhite = Color(0xFFFFFFFF);
    const expectedBlack = Color(0xFF000000);
    const expectedLightBlueButton = Color.fromARGB(255, 202, 238, 254);

    const white = AppColors.white;
    const black = AppColors.black;
    const lightBlueButton = AppColors.lightBlueButton;

    expect(white, equals(expectedWhite));
    expect(black, equals(expectedBlack));
    expect(lightBlueButton, equals(expectedLightBlueButton));
  });
}
