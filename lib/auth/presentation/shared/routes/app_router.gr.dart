// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../confirm_sms_code_screen/confirm_sms_code_screen.dart' as _i2;
import '../../password_screen/password_screen.dart' as _i3;
import '../../phone_number_secreen/phone_number_screen.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    PhoneNumberScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.PhoneNumberScreen());
    },
    ConfirmSmsCodeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmSmsCodeScreenRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.ConfirmSmsCodeScreen(
              key: args.key, phoneNumber: args.phoneNumber));
    },
    PasswordScreenRoute.name: (routeData) {
      final args = routeData.argsAs<PasswordScreenRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.PasswordScreen(
              key: args.key, phoneNumber: args.phoneNumber, code: args.code));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(PhoneNumberScreenRoute.name, path: '/'),
        _i4.RouteConfig(ConfirmSmsCodeScreenRoute.name,
            path: '/confirm-sms-code-screen'),
        _i4.RouteConfig(PasswordScreenRoute.name, path: '/password-screen')
      ];
}

/// generated route for [_i1.PhoneNumberScreen]
class PhoneNumberScreenRoute extends _i4.PageRouteInfo<void> {
  const PhoneNumberScreenRoute() : super(name, path: '/');

  static const String name = 'PhoneNumberScreenRoute';
}

/// generated route for [_i2.ConfirmSmsCodeScreen]
class ConfirmSmsCodeScreenRoute
    extends _i4.PageRouteInfo<ConfirmSmsCodeScreenRouteArgs> {
  ConfirmSmsCodeScreenRoute({_i5.Key? key, required String phoneNumber})
      : super(name,
            path: '/confirm-sms-code-screen',
            args: ConfirmSmsCodeScreenRouteArgs(
                key: key, phoneNumber: phoneNumber));

  static const String name = 'ConfirmSmsCodeScreenRoute';
}

class ConfirmSmsCodeScreenRouteArgs {
  const ConfirmSmsCodeScreenRouteArgs({this.key, required this.phoneNumber});

  final _i5.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'ConfirmSmsCodeScreenRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for [_i3.PasswordScreen]
class PasswordScreenRoute extends _i4.PageRouteInfo<PasswordScreenRouteArgs> {
  PasswordScreenRoute({_i5.Key? key, required String phoneNumber, String? code})
      : super(name,
            path: '/password-screen',
            args: PasswordScreenRouteArgs(
                key: key, phoneNumber: phoneNumber, code: code));

  static const String name = 'PasswordScreenRoute';
}

class PasswordScreenRouteArgs {
  const PasswordScreenRouteArgs(
      {this.key, required this.phoneNumber, this.code});

  final _i5.Key? key;

  final String phoneNumber;

  final String? code;

  @override
  String toString() {
    return 'PasswordScreenRouteArgs{key: $key, phoneNumber: $phoneNumber, code: $code}';
  }
}
