import 'dart:math';

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
}
