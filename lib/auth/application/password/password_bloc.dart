import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_authorization/auth/domain/auth_info.dart';
import 'package:test_authorization/auth/infrastructure/auth_info_dto.dart';
import 'package:test_authorization/auth/infrastructure/i_local_storage.dart';

part 'password_event.dart';
part 'password_state.dart';
part 'password_bloc.freezed.dart';

@injectable
class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final ILocalStorage _localStorage;
  PasswordBloc(this._localStorage) : super(PasswordState.initial());
  @override
  Stream<PasswordState> mapEventToState(PasswordEvent event) async* {
    yield* event.map(
      initialized: (e) async* {
        AuthInfo authInfo = AuthInfo.empty();
        if (e.code == null) {
          final authInfoDTO = await _localStorage.getAuthInfo(e.phoneNumber);
          authInfo = authInfoDTO.toDomain();
        }
        yield state.copyWith(
          code: e.code,
          phoneNumber: e.phoneNumber,
          authInfo: authInfo,
        );
      },
      changedPassword: (e) async* {
        final isEnableBtn = state.code != null
            ? e.password.length == 4
            : e.password == state.authInfo.password;
        yield state.copyWith(password: e.password, isEnableBtn: isEnableBtn);
      },
      pressedButn: (e) async* {
        _localStorage.putAuthInfo(
          AuthInfoDTO(
            phoneNumber: state.phoneNumber,
            password: state.password,
          ),
        );
      },
      submittedPassword: (e) async* {
        final isShowError =
            state.code != null ? false : e.password != state.authInfo.password;
        yield state.copyWith(isShowError: isShowError);
      },
    );
  }
}
