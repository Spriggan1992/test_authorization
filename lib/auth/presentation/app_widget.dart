import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_authorization/auth/presentation/shared/routes/app_router.gr.dart';

import 'shared/res/theme/app_theme.dart';

final _appRouter = AppRouter();

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.white),
    );
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      theme: setUpThemeData(),
      title: 'Test app',
    );
  }
}
