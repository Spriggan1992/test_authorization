import 'package:auto_route/annotations.dart';
import 'package:test_authorization/auth/presentation/confirm_sms_code_screen/confirm_sms_code_screen.dart';
import 'package:test_authorization/auth/presentation/password_screen/password_screen.dart';
import 'package:test_authorization/auth/presentation/phone_number_secreen/phone_number_screen.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: PhoneNumberScreen, initial: true),
    MaterialRoute(page: ConfirmSmsCodeScreen),
    MaterialRoute(page: PasswordScreen),
  ],
)
class $AppRouter {}
