import './views/main_menu.dart';
import './views/menu.dart';
import 'models/coin_list_model.dart';

void main(List<String> args) {
  MenuStatus mainMenuState;
  MainMenu mainMenu = MainMenu();
  CoinList coinList = CoinList();
  do {
    mainMenuState = mainMenu.show(coinList);
  } while (mainMenuState == MenuStatus.running);
}
