import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_authorization/auth/application/password/password_bloc.dart';
import 'package:test_authorization/auth/presentation/shared/routes/app_router.gr.dart';
import 'package:test_authorization/auth/presentation/shared/widgets/pin_code_field.dart';
import 'package:test_authorization/auth/presentation/shared/widgets/screen_content.dart';
import 'package:test_authorization/injection.dart';

class PasswordScreen extends StatelessWidget {
  final String phoneNumber;
  final String? code;
  const PasswordScreen({Key? key, required this.phoneNumber, this.code})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PasswordBloc>()
        ..add(PasswordEvent.initialized(phoneNumber, code)),
      child: BlocBuilder<PasswordBloc, PasswordState>(
        builder: (context, state) {
          return ScreenContent(
            title: code == null ? "Введите пароль" : "Задате пароль",
            textFieldContent: PinCodeField(
              isError: state.isShowError,
              onChanged: (value) => context
                  .read<PasswordBloc>()
                  .add(PasswordEvent.changedPassword(value)),
              obscureText: true,
              onCompleted: (value) {
                context
                    .read<PasswordBloc>()
                    .add(PasswordEvent.submittedPassword(value));
              },
            ),
            clickButton: state.isEnableBtn
                ? () {
                    context
                        .read<PasswordBloc>()
                        .add(const PasswordEvent.pressedButn());
                    AutoRouter.of(context).pushAndPopUntil(
                      const PhoneNumberScreenRoute(),
                      predicate: (route) =>
                          route.settings.name == PhoneNumberScreenRoute.name,
                    );
                  }
                : null,
          );
        },
      ),
    );
  }
}
