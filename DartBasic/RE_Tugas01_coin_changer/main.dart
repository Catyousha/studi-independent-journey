import './views/main_menu.dart';
import './views/menu.dart';

void main(List<String> args) {
  MenuStatus mainMenuState;
  do {
    mainMenuState = MainMenu.show();
  } while (mainMenuState == MenuStatus.running);
}
