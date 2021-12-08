import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:test_authorization/injection.dart';

import 'auth/infrastructure/sembast_database.dart';
import 'auth/presentation/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await getIt<SembastDatabase>().init();
  runApp(const AppWidget());
}
