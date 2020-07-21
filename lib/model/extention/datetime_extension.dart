extension DateTimeExtension on DateTime {
  String toStringForJson() {
    return '$year${month < 10 ? 0 : ''}$month${day < 10 ? 0 : ''}$day';
  }

  String toStringForHuman() {
    String result;
    if (this == null) {
      result = null;
    } else {
      result = '${day < 10 ? 0 : ''}$day.${month < 10 ? 0 : ''}$month.$year';
    }
    return result;
  }
}
