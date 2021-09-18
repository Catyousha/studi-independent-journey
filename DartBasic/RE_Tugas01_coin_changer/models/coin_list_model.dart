import './coin_model.dart';

class CoinList {
  List<Coin> coinList = [];
  List<Coin> get get_coins {
    return [...coinList];
  }

  void add_coin(Coin coin) {
    coinList.add(coin);
  }

  void remove_coin(Coin coin) {
    coinList.remove(coin);
  }
}
