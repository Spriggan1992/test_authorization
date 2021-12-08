part of 'password_bloc.dart';

@freezed
class PasswordState with _$PasswordState {
  const factory PasswordState({
    required String phoneNumber,
    required String password,
    required bool isEnableBtn,
    required bool isShowError,
    String? code,
    required AuthInfo authInfo,
  }) = _PasswordState;
  factory PasswordState.initial() => PasswordState(
        phoneNumber: '',
        password: '',
        isEnableBtn: false,
        isShowError: false,
        authInfo: AuthInfo.empty(),
      );
}
