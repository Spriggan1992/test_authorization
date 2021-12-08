part of 'phone_number_bloc.dart';

@freezed
class PhoneNumberEvent with _$PhoneNumberEvent {
  const factory PhoneNumberEvent.initialized() = _Initialized;
  const factory PhoneNumberEvent.changedTextValue(String value) =
      _ChangedTextValue;
  const factory PhoneNumberEvent.pressedBtn() = _PressedBtn;
  const factory PhoneNumberEvent.resetStates() = _ResetStates;
}
