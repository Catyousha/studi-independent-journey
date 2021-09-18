enum MenuStatus {
  running,
  stopped,
}

abstract class Menu {
  static MenuStatus show() {
    return MenuStatus.running;
  }
}
