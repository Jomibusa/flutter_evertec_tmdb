import 'package:domain/movie/model/tracking.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infrastructure/movie/local/database.dart';

import 'helper_mixin.dart';

void main() {
  late HelperMixinTest mockClass;
  setUp(() => mockClass = HelperMixinTest());

  test('parse movieDB to domain should be the same', () {
    //Arrange
    const trackingData =
        TrackingData(id: 297761, date: '2023-04-21 07:00:00.000');
    const tracking = Tracking(id: 297761, date: '2023-04-21 07:00:00.000');

    //Act
    final trackingDomain = mockClass.parseTrackingDBToDomain(trackingData);

    //Assert
    expect(trackingDomain.date, tracking.date);
  });
}
