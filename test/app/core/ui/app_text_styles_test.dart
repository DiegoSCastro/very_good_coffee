import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart';

void main() {
  test('AppTextStyles.bodyMedium should be a TextStyle with default properties',
      () {
    const textStyle = AppTextStyles.bodyMedium;

    expect(textStyle, isA<TextStyle>());

    expect(textStyle.color, null);
    expect(textStyle.fontSize, null);
    expect(textStyle.fontWeight, null);
    expect(textStyle.fontStyle, null);
  });
}
