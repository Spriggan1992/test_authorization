import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_authorization/auth/application/phone_number/phone_number_bloc.dart';
import 'package:test_authorization/auth/presentation/shared/constants/constants.dart';
import 'package:test_authorization/auth/presentation/shared/routes/app_router.gr.dart';
import 'package:test_authorization/auth/presentation/shared/widgets/screen_content.dart';
import 'package:test_authorization/injection.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhoneNumberBloc>(
      create: (_) =>
          getIt<PhoneNumberBloc>()..add(const PhoneNumberEvent.initialized()),
      child: BlocConsumer<PhoneNumberBloc, PhoneNumberState>(
        listener: (context, state) {
          if (state.redirectToPasswordScreen) {
            AutoRouter.of(context).push(
              PasswordScreenRoute(phoneNumber: state.phoneNumber),
            );
          }
          if (state.redirectConfirmCode) {
            AutoRouter.of(context).push(
              ConfirmSmsCodeScreenRoute(phoneNumber: state.phoneNumber),
            );
          }
        },
        builder: (context, state) {
          return ScreenContent(
            title: "Мой номер телефона",
            textFieldContent: TextFormField(
              style: const TextStyle(fontSize: 24),
              inputFormatters: [maskFormatter],
              autofocus: true,
              decoration:
                  const InputDecoration(hintText: "Введите номер телефона"),
              onChanged: (value) {
                context.read<PhoneNumberBloc>().add(
                      PhoneNumberEvent.changedTextValue(value),
                    );
              },
              validator: (value) => "",
              autovalidateMode: AutovalidateMode.disabled,
            ),
            clickButton: state.isEnableBtn
                ? () {
                    context
                        .read<PhoneNumberBloc>()
                        .add(const PhoneNumberEvent.pressedBtn());
                    context
                        .read<PhoneNumberBloc>()
                        .add(const PhoneNumberEvent.resetStates());
                  }
                : null,
            notificationMessageContent: const Text(
              "Вам придёт сообщение с кодом.\nНикому его не говорите.",
            ),
          );
        },
      ),
    );
  }
}
