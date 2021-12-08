import 'package:injectable/injectable.dart';

import '../sembast_database.dart';

@module
abstract class AppInjectableModule {
  @lazySingleton
  SembastDatabase get sembastDb => SembastDatabase();
}
