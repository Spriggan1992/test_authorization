part of 'phone_number_bloc.dart';

@freezed
class PhoneNumberState with _$PhoneNumberState {
  const factory PhoneNumberState({
    required String phoneNumber,
    required bool isEnableBtn,
    required bool redirectToPasswordScreen,
    required bool redirectConfirmCode,
  }) = _AuthState;
  factory PhoneNumberState.initial() => const PhoneNumberState(
        phoneNumber: "",
        isEnableBtn: false,
        redirectToPasswordScreen: false,
        redirectConfirmCode: false,
      );
}
