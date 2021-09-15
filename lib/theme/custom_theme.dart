import 'package:day1/theme/fonts.dart';
import 'package:flutter/material.dart';

class CustomTheme with ChangeNotifier {
  bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Color(0xffFFFFFF),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xffD3E3FD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textTheme: TextTheme(
        headline1: AppFont.fontstyle1,
        headline2: AppFont.fontstyle1,
        headline3: AppFont.fontstyle1,
        headline4: AppFont.fontstyle1,
        headline5: AppFont.fontstyle1,
        headline6: AppFont.fontstyle1,
        subtitle1: AppFont.fontstyle1,
        subtitle2: AppFont.fontstyle1,
        bodyText1: AppFont.fontstyle1,
        bodyText2: AppFont.fontstyle1,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: Color(0xffFFFFFF),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xffD3E3FD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textTheme: TextTheme(
        headline1: AppFont.fontstyle2,
        headline2: AppFont.fontstyle2,
        headline3: AppFont.fontstyle2,
        headline4: AppFont.fontstyle2,
        headline5: AppFont.fontstyle2,
        headline6: AppFont.fontstyle2,
        subtitle1: AppFont.fontstyle2,
        subtitle2: AppFont.fontstyle2,
        bodyText1: AppFont.fontstyle2,
        bodyText2: AppFont.fontstyle2,
      ),
    );
  }
}
