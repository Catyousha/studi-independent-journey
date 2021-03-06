import './coin_model.dart';

class CoinList {
  List<Coin> _coinList = [
    Coin(value: 1),
    Coin(value: 2),
    Coin(value: 5),
    Coin(value: 10),
  ];

  List<Coin> get get_coins {
    _coinList.sort((a, b) {
      return a.value.compareTo(b.value);
    });
    return [..._coinList];
  }

  int get lowest_coin {
    return _coinList
        .reduce((val, ele) => (val.value < ele.value) ? val : ele)
        .value;
  }

  bool coinExist(Coin coin) {
    int searchCoin =
        _coinList.indexWhere((element) => (element.value == coin.value));
    return (searchCoin != -1);
  }

  CoinList add(Coin coin) {
    this._coinList.add(coin);
    return this;
  }

  CoinList remove(Coin coin) {
    this._coinList.removeWhere((element) => element.value == coin.value);
    return this;
  }
}
