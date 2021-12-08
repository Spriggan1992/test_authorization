import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test_authorization/auth/presentation/shared/res/colors/colors.dart';

class PinCodeField extends StatelessWidget {
  final bool obscureText;
  final Function(String) onChanged;
  final Function(String)? onCompleted;
  final bool isError;
  const PinCodeField({
    Key? key,
    this.obscureText = false,
    required this.onChanged,
    this.onCompleted,
    required this.isError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 4,
      onChanged: onChanged,
      onCompleted: onCompleted,
      appContext: context,
      obscureText: obscureText,
      animationType: AnimationType.none,
      pinTheme: PinTheme(
        fieldWidth: 60,
        activeColor: isError ? Palette.errorColor : Palette.primaryColor,
        inactiveFillColor: Palette.primaryColor,
        selectedColor: Palette.primaryColor,
        inactiveColor: Palette.primaryColor,
      ),
    );
  }
}
