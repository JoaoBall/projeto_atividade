extension DoubleExtensions on double {
  String? toDecimalString() {
    return toString().replaceAll(',', '.');
  }
}
