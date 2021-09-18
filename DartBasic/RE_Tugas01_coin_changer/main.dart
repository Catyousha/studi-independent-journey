import './views/main_menu.dart';
import './views/menu.dart';
import 'models/coin_list_model.dart';

void main(List<String> args) {
  MenuStatus mainMenuState;
  CoinList coinList = CoinList();
  do {
    mainMenuState = MainMenu().show(coinList);
  } while (mainMenuState == MenuStatus.running);
}
