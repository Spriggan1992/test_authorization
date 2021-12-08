import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_authorization/auth/presentation/shared/res/colors/colors.dart';

/// Represent main appbar.
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  const MainAppBar({
    Key? key,
    required this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          if (AutoRouter.of(context).current.name != "PhoneNumberScreenRoute") {
            context.router.pop();
          }
        },
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Palette.grey,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
