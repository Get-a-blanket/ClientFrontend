import 'package:flutter/material.dart';
import 'colors.dart';

const fontFamily = "Inter";
TextTheme textTheme = TextTheme(
    labelLarge: TextStyle(
      fontSize: 30.0,
      color: onPrimaryColor,
      fontWeight: FontWeight.w800,
      fontFamily: "Inter",
    ),
    labelMedium: TextStyle(
      fontSize: 30.0,
      color: onSecondaryColor,
      fontWeight: FontWeight.w600,
      fontFamily: "Inter",
    ),
    titleLarge: const TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.w800,
      fontFamily: "Inter",
    ),
    titleMedium: const TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      fontFamily: "Inter",
    ),
    titleSmall: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      fontFamily: "Inter",
    )
);
