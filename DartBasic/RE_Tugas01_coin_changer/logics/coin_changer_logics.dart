import '../models/coin_model.dart';

class CoinChangerLogics {

  Map<int, List<Coin>?> memoizedCoins = {};

  List<Coin>? coin_changer(List<Coin> coinList, int tempCoin, int? addedCoin) {
    if (this.memoizedCoins[tempCoin] != null) {
      return this.memoizedCoins[tempCoin];
    }

    if (tempCoin < 0) {
      return null;
    }

    //referensi algoritma: TOKI
    for (Coin coin in coinList.reversed) {
      if (tempCoin >= coin.value) {
        List<Coin>? coinTaken =
            coin_changer(coinList, tempCoin - coin.value, coin.value);
        List<Coin>? best = this.memoizedCoins[tempCoin];

        if (coinTaken != null && best != null) {
          this.memoizedCoins[tempCoin] =
              ((coinTaken.length) < (best.length)) ? coinTaken : best;
        } else {
          this.memoizedCoins[tempCoin] = (best) ?? (coinTaken);
        }
      }
    }

    if (addedCoin != null) {
      this.memoizedCoins[tempCoin] = [
        ...this.memoizedCoins[tempCoin] ?? [],
        Coin(value: addedCoin)
      ];
    }

    return this.memoizedCoins[tempCoin];
  }
}
