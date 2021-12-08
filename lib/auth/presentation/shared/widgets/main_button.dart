import 'package:flutter/material.dart';
import 'package:test_authorization/auth/presentation/shared/res/colors/colors.dart';

/// Represent main reusable button.
class MainButton extends StatelessWidget {
  final VoidCallback? onClick;

  const MainButton({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: onClick == null ? Palette.grey : Palette.btnColor,
        ),
        onPressed: onClick,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text(
            "Продолжить",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
