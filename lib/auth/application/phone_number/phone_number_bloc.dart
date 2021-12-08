import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:test_authorization/auth/infrastructure/i_local_storage.dart';

part 'phone_number_bloc.freezed.dart';
part 'phone_number_event.dart';
part 'phone_number_state.dart';

@injectable
class PhoneNumberBloc extends Bloc<PhoneNumberEvent, PhoneNumberState> {
  final ILocalStorage _localStorage;
  PhoneNumberBloc(this._localStorage) : super(PhoneNumberState.initial());
  @override
  Stream<PhoneNumberState> mapEventToState(PhoneNumberEvent event) async* {
    yield* event.map(
      initialized: (e) async* {
        yield state.copyWith(
          isEnableBtn: false,
          phoneNumber: "",
          redirectConfirmCode: false,
          redirectToPasswordScreen: false,
        );
      },
      changedTextValue: (e) async* {
        yield state.copyWith(
          phoneNumber: e.value,
          isEnableBtn: e.value.length >= 12,
        );
      },
      pressedBtn: (e) async* {
        final hasAlreadyRegistered =
            await _localStorage.chekUserHasAlreadyRegistered(state.phoneNumber);
        yield state.copyWith(
          redirectConfirmCode: !hasAlreadyRegistered,
          redirectToPasswordScreen: hasAlreadyRegistered,
        );
      },
      resetStates: (e) async* {
        yield state.copyWith(
          isEnableBtn: state.phoneNumber.length >= 12,
          phoneNumber: state.phoneNumber,
          redirectConfirmCode: false,
          redirectToPasswordScreen: false,
        );
      },
    );
  }
}
