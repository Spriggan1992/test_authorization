part of 'password_bloc.dart';

@freezed
class PasswordState with _$PasswordState {
  const factory PasswordState({
    required String phoneNumber,
    required String password,
    required bool isEnableBtn,
    required bool isValid,
    String? code,
    required AuthInfo authInfo,
  }) = _PasswordState;
  factory PasswordState.initial() => PasswordState(
        phoneNumber: '',
        password: '',
        isEnableBtn: false,
        isValid: false,
        authInfo: AuthInfo.empty(),
      );
}
