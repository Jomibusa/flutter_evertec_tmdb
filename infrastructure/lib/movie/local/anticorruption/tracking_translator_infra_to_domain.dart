import 'package:domain/movie/model/tracking.dart';
import 'package:infrastructure/movie/local/database.dart';

mixin TrackingTranslatorInfraToDomain {
  Tracking parseTrackingDBToDomain(TrackingData trackingData) {
    return Tracking(id: trackingData.id, date: trackingData.date);
  }
}
