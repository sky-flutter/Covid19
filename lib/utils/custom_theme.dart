import 'package:covid19/utils/imports.dart';

class CustomThemeData {
  static lightTheme() {
    return ThemeData(
        accentColor: CustomColors.COLORS_ACCENT,
        primaryColor: CustomColors.COLORS_PRIMARY,
        textSelectionColor: Colors.black,
        backgroundColor: Colors.grey.shade100);
  }

  static darkTheme() {
    return ThemeData(
        accentColor: CustomColors.COLORS_ACCENT,
        primaryColor: CustomColors.COLORS_PRIMARY,
        textSelectionColor: Colors.white,
        backgroundColor: Colors.black);
  }
}
