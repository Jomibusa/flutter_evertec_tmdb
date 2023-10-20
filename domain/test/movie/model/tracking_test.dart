// ignore_for_file: lines_longer_than_80_chars

import 'package:domain/movie/model/tracking.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('tracking can be create successful', () {
    //Arrange
    //Act
    const tracking = Tracking(id: 297761, date: '2023-04-21 07:00:00.000');
    //Assert
    expect(tracking, isNotNull);
  });
}
