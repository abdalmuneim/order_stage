class AssetsManager {
  static const String _basePATH = 'assets/images';
  static const String _basePATHAnimations = 'assets/animations';

  /// animations
  static String get wifiConnection =>
      "$_basePATHAnimations/wifi-connecting.json";
  static String get bluetoothConnection =>
      "$_basePATHAnimations/bluetooth-searching.json";
  static String get loading => "$_basePATHAnimations/loading.json";

  /// images
  static const String logo = '$_basePATH/empty_logo.png';
}
