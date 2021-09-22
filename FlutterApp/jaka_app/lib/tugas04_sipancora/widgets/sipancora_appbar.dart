import 'package:flutter/material.dart';
import '../styles/colors.dart';
import './sipancora_text.dart';

class SipancoraAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor = Colors.red;
  final Widget? title;
  final IconData leadingIcon;
  final VoidCallback onPressLeadingIcon;

  const SipancoraAppBar({
    Key? key,
    this.title,
    required this.leadingIcon,
    required this.onPressLeadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: this.title ?? SipancoraText(),
      ),
      leading: IconButton(
        onPressed: onPressLeadingIcon,
        icon: Icon(leadingIcon),
        color: colorInkDarkest,
      ),
      backgroundColor: colorSkyWhite,
      elevation: 2,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
