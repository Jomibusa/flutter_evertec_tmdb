import 'package:flutter_evertec_tmdb/setup_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return setUpApp();
});
