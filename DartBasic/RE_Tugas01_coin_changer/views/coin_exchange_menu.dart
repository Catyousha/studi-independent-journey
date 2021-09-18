import 'dart:io';
import './menu.dart';

class CoinExchangeMenu implements Menu {
  static MenuStatus show() {
    return MenuStatus.running;
  }
}
