import 'package:flutter/material.dart';
import '../styles/colors.dart';

class IconWithNotification extends StatelessWidget {
  const IconWithNotification({
    Key? key,
    required this.notifIcon,
    this.iconSize = 28.0,
    this.notifRadius = 10.0,
  }) : super(key: key);

  final IconData notifIcon;
  final double iconSize;
  final double notifRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Center(
        child: Stack(
          children: [
            Icon(
              notifIcon,
              size: iconSize,
              color: mondPriNavyBlack,
            ),
            Positioned(
              right: 0.0,
              child: Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                width: notifRadius,
                height: notifRadius,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
