import 'package:flutter/material.dart';
import 'package:flutter_evertec_tmdb/config/router/app_router.dart';
import 'package:flutter_evertec_tmdb/config/theme/app_theme.dart';
import 'package:flutter_evertec_tmdb/di/injector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies('dev');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
