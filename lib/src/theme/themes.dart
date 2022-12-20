library theme;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mara_ui/src/theme/null_ink_splash_factory.dart';

class DefaultThemes {
  // on[const Color] is basically a text const Color??

  static Color get lightTextColor => const Color.fromARGB(255, 0, 0, 0);
  static Color get darkTextColor => const Color.fromARGB(127, 255, 255, 255);

  static ColorScheme get darkScheme => ColorScheme(
        brightness: Brightness.dark,
        primary: const Color(0xff245AF1),
        onPrimary: darkTextColor,
        primaryContainer: const Color(0xff8CA9F8),
        onPrimaryContainer: darkTextColor,
        secondary: const Color(0xff245AF1),
        onSecondary: darkTextColor,
        secondaryContainer: const Color(0xff8CA9F8),
        onSecondaryContainer: darkTextColor,
        error: const Color(0xffE63946),
        onError: darkTextColor,
        errorContainer: const Color(0xffEF8089),
        background: const Color(0xff1a1a1a), // 0xff292929
        onBackground: darkTextColor,
        surface: const Color(0xff222222), // 0xff313131
        onSurface: darkTextColor,
      );

  static ColorScheme get lightScheme => ColorScheme(
        brightness: Brightness.light,
        primary: const Color(0xff245AF1),
        onPrimary: lightTextColor,
        primaryContainer: const Color(0xff8CA9F8),
        onPrimaryContainer: lightTextColor,
        secondary: const Color(0xff245AF1),
        onSecondary: lightTextColor,
        secondaryContainer: const Color(0xff8CA9F8),
        onSecondaryContainer: lightTextColor,
        error: const Color(0xffE63946),
        onError: lightTextColor,
        errorContainer: const Color(0xffEF8089),
        background: const Color(0xffffffff),
        onBackground: lightTextColor,
        surface: const Color(0xfff9f9f9),
        onSurface: lightTextColor,
      );

  static TextTheme get textTheme => TextTheme(
        headline1: GoogleFonts.roboto(
          fontSize: 96,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
        ),
        headline2: GoogleFonts.roboto(
          fontSize: 60,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
        ),
        headline3: GoogleFonts.roboto(
          fontSize: 48,
          fontWeight: FontWeight.w400,
        ),
        headline4: GoogleFonts.roboto(
          fontSize: 34,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        headline5: GoogleFonts.roboto(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        headline6: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        subtitle1: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
        ),
        subtitle2: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        bodyText1: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        bodyText2: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        button: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
        caption: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        overline: GoogleFonts.roboto(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
      );

  static ThemeData themeData(ColorScheme colorScheme) => ThemeData.from(
        colorScheme: colorScheme,
        textTheme: textTheme,
      ).copyWith(
        splashFactory: const NullInkSplashFactory(),
        useMaterial3: true,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: colorScheme.onSurface.withOpacity(0.75),
            disabledForegroundColor: colorScheme.onSurface,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.black,
            maximumSize: const Size(double.infinity, 36),
            elevation: 0,
            textStyle: textTheme.button,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            enabledMouseCursor: SystemMouseCursors.click,
            disabledMouseCursor: SystemMouseCursors.basic,
            splashFactory: const NullInkSplashFactory(),
          ),
        ),
      );

  static ThemeData get darkTheme => themeData(darkScheme);
  static ThemeData get lightTheme => themeData(lightScheme);
}
