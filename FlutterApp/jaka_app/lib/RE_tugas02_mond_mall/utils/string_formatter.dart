String numberToRupiah(int number) {
  String strNum = number.toString();
  String result = "";
  int digitCounter = 1;
  for (int i = strNum.length - 1; i >= 0; i--) {
    result += strNum[i];
    if (digitCounter % 3 == 0 && i != 0) {
      result += '.';
    }
    digitCounter++;
  }

  return result.split('').reversed.join();
}
