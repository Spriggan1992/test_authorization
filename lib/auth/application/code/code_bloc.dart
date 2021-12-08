import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'code_bloc.freezed.dart';
part 'code_event.dart';
part 'code_state.dart';

@injectable
class CodeBloc extends Bloc<CodeEvent, CodeState> {
  CodeBloc() : super(CodeState.initial());
  @override
  Stream<CodeState> mapEventToState(CodeEvent event) async* {
    yield* event.map(
      initialized: (e) async* {
        yield state.copyWith(phoneNumber: e.phoneNumber);
      },
      changeCodeValue: (e) async* {
        yield state.copyWith(
          code: e.code,
          isShowErrorMessage: false,
          isEnableBtn: state.validatedCode == e.code,
        );
      },
      onSubmitCode: (e) async* {
        if (state.validatedCode == e.code) {
          yield state.copyWith(
            isShowErrorMessage: state.validatedCode != e.code,
            isEnableBtn: true,
          );
        } else {
          yield state.copyWith(
            isShowErrorMessage: state.validatedCode != e.code,
            isEnableBtn: false,
          );
        }
      },
    );
  }
}
