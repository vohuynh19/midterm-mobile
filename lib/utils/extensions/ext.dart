import 'package:intl/intl.dart';

extension DoubleExt on num {
  formatCurrency() => NumberFormat('#,##0.####').format(this);

  String formatCoin() => NumberFormat('#,##0.000').format(this);

  String toFixedLength(int length) {
    var str = toString().split(".");
    if (str[1].length > length) {
      return toStringAsFixed(length);
    } else {
      return toString();
    }
  }
}
