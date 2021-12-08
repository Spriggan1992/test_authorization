import 'package:flutter/material.dart';
import 'package:test_authorization/auth/presentation/shared/res/colors/colors.dart';

import 'main_appbar.dart';
import 'main_button.dart';

/// Represent content for screens.
class ScreenContent extends StatelessWidget {
  final String title;
  final Widget textFieldContent;
  final void Function()? clickButton;
  final Widget? notificationMessageContent;
  const ScreenContent({
    Key? key,
    required this.title,
    required this.textFieldContent,
    required this.clickButton,
    this.notificationMessageContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        appBar: AppBar(),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 28, color: Palette.primaryColor),
              ),
            ),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textFieldContent,
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: notificationMessageContent,
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MainButton(onClick: clickButton),
            )
          ],
        ),
      ),
    );
  }
}
