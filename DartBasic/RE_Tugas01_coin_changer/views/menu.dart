enum MenuStatus {
  running,
  stopped,
  stayInSubmenu,
}

abstract class Menu {
  static MenuStatus show() {
    return MenuStatus.running;
  }
}
