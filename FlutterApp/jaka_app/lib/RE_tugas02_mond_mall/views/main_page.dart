import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/icon_with_notif.dart';
import '../styles/mond_text_styles.dart';

class MondMainPage extends StatelessWidget {
  const MondMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MondTextStyles _mondTextStyles = MondTextStyles(
      context: context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Mond Mall',
            style: _mondTextStyles.blueAppBarText,
          ),
        ),
        actions: <Widget>[
          IconWithNotification(
            notifIcon: Icons.notifications_outlined,
          ),
          IconWithNotification(
            notifIcon: Icons.shopping_cart_outlined,
          ),
          SizedBox(
            width: 8.0,
          ),
        ],
      ),
      bottomNavigationBar: MondBottomNavigationBar(
        context: context,
      ),
    );
  }
}
