import '../models/coin_list_model.dart';
import '../models/coin_model.dart';

class CoinChangerLogics {
  List<Coin> coinList = CoinList().get_coins;
  Map<int, List<Coin>?> memoized_coins = {};

  List<Coin>? coin_changer(int temp_coin, int? added_coin) {

    if (this.memoized_coins[temp_coin] != null) {
      return this.memoized_coins[temp_coin];
    }

    if (temp_coin < 0) {
      return null;
    }

    //referensi algoritma: TOKI
    for (Coin coin in coinList.reversed) {
      if (temp_coin >= coin.value) {
        List<Coin>? coinTaken =
            coin_changer(temp_coin - coin.value, coin.value);
        List<Coin>? best = this.memoized_coins[temp_coin];

        if (coinTaken != null && best != null) {
          this.memoized_coins[temp_coin] =
              ((coinTaken.length) < (best.length)) ? coinTaken : best;
        } else {
          this.memoized_coins[temp_coin] = (best) ?? (coinTaken);
        }
      }
    }

    if (added_coin != null) {
      this.memoized_coins[temp_coin] = [
        ...this.memoized_coins[temp_coin] ?? [],
        Coin(value: added_coin)
      ];
    }

    return this.memoized_coins[temp_coin];
  }
}
