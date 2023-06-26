extension StringExtension on String {
  String convertIsbn10() {
    const startIsbn10 = 3;
    const endIsbn10 = 12;
    const sumDefault = 0;
    const checkDigitValue = 11;
    const checkDigitXValue = 10;

    final isbn13 = replaceFirst('-', '');
    final isbn = isbn13.substring(startIsbn10, endIsbn10);
    var sum = sumDefault;
    sum = isbn.split('').asMap().entries.map((e) {
      return int.parse(e.value) * (e.key + 1);
    }).reduce((value, element) => value + element);

    sum = checkDigitValue - (sum % checkDigitValue);
    String sumString;
    if (sum == checkDigitXValue) {
      sumString = 'X';
    } else if (sum == checkDigitValue) {
      sumString = '0';
    } else {
      sumString = sum.toString();
    }
    final isbn10 = '$isbn$sumString';
    return isbn10;
  }
}
