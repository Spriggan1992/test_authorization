import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_authorization/auth/application/code/code_bloc.dart';
import 'package:test_authorization/auth/presentation/shared/res/colors/colors.dart';
import 'package:test_authorization/auth/presentation/shared/routes/app_router.gr.dart';
import 'package:test_authorization/auth/presentation/shared/widgets/pin_code_field.dart';
import 'package:test_authorization/auth/presentation/shared/widgets/screen_content.dart';
import 'package:test_authorization/injection.dart';

class ConfirmSmsCodeScreen extends StatelessWidget {
  final String phoneNumber;
  const ConfirmSmsCodeScreen({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CodeBloc>(
      create: (_) => getIt<CodeBloc>()..add(CodeEvent.initialized(phoneNumber)),
      child: BlocBuilder<CodeBloc, CodeState>(
        builder: (context, state) {
          return ScreenContent(
            title: "Код из сообщения",
            textFieldContent: PinCodeField(
              isError: state.isShowErrorMessage,
              onChanged: (value) => context.read<CodeBloc>().add(
                    CodeEvent.changeCodeValue(value),
                  ),
              onCompleted: (value) => context.read<CodeBloc>().add(
                    CodeEvent.onSubmitCode(value),
                  ),
            ),
            notificationMessageContent: Text(
              state.isShowErrorMessage
                  ? "Неправильный код\nПовторите пожалуйста еще раз."
                  : "",
              style: const TextStyle(color: Palette.errorColor),
            ),
            clickButton: state.isEnableBtn
                ? () => AutoRouter.of(context).replace(
                      PasswordScreenRoute(
                        phoneNumber: state.phoneNumber,
                        code: state.code,
                      ),
                    )
                : null,
          );
        },
      ),
    );
  }
}
