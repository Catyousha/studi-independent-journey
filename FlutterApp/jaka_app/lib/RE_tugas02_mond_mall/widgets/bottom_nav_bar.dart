import 'package:flutter/material.dart';
import '../styles/colors.dart';

class MondBottomNavigationBar extends StatelessWidget {
  const MondBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 10.0,
      unselectedItemColor: mondPriNavyBlack,
      selectedItemColor: mondPriBlueOcean,
      showUnselectedLabels: true,
      selectedFontSize: 10.0,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: mondPriBlueOcean,
      ),
      unselectedFontSize: 10.0,
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: mondPriNavyBlack,
      ),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
          ),
          label: "HOME",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_outline,
          ),
          label: "WISHLIST",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_bag_outlined,
          ),
          label: "ORDER",
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: Colors.amber,
            radius: 12,
          ),
          label: "ACCOUNT",
        ),
      ],
    );
  }
}
