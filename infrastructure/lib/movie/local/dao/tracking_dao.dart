import 'package:drift/drift.dart';
import 'package:infrastructure/movie/local/database.dart';
import 'package:infrastructure/movie/local/tables/tracking.dart';

part 'tracking_dao.g.dart';

@DriftAccessor(tables: [Tracking])
class TrackingDao extends DatabaseAccessor<AppDatabase>
    with _$TrackingDaoMixin {
  TrackingDao(super.database);

  //Get all the tracking from db
  Future<List<TrackingData>> getTracking() async {
    return select(tracking).get();
  }

  //Insert new tracking in db
  Future<int> insertTracking(TrackingCompanion trackingCompanion) async {
    return into(tracking).insert(trackingCompanion);
  }

  //Update tracking in db
  Future<bool> updateTracking(TrackingData trackingData) async {
    return update(tracking).replace(trackingData);
  }

  Stream<TrackingData> watchTrackingWithId(int id) {
    return (select(tracking)..where((u) => u.id.equals(id))).watchSingle();
  }
}
