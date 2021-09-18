import './coin_model.dart';

class CoinList {
  List<Coin> coinList = [
    Coin(value: 1000),
    Coin(value: 2000),
    Coin(value: 5000),
    Coin(value: 10000),
  ];

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
