import 'package:flutter/material.dart';
import 'package:get_a_blanket/map/map_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'machine/machine_page.dart';
import 'machine_code/machine_code_page.dart';

void main() {
  runApp(const RestartWidget(child: MyApp()));
}

class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  State<StatefulWidget> createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) =>
        prefs.remove('takeBlanket')); // удаляем данные о типе операции с пледом
    Color primaryColor = const Color(0xff3f7641);
    Color secondaryColor = const Color(0xff71BA74);
    Color onPrimaryColor = const Color(0xffffffff);
    Color onSecondaryColor = const Color(0xff000000);
    // Color secondaryVariantColor = const Color(0xFFFFFFFF);
    return MaterialApp(
      title: 'Get a blanket',
      initialRoute: "/",
      theme: ThemeData(
        // primarySwatch: Colors.green,
        primaryColor: primaryColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
          onPrimary: onPrimaryColor,
          onSecondary: onSecondaryColor,
          // secondaryVariant: secondaryVariantColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 30,
            bottom: 30,
          ),
        )),
        fontFamily: "Inter",
        textTheme: TextTheme(
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
          ),
        ),
      ),
      routes: {
        "/": (context) => const MapPage(),
        "/post": (context) => const MachinePage(),
        "/code": (context) => const MachineCodePage(),
        // "/phone_number": (context) => const PhoneNumberPage(),
        // "/tariff": (context) => const TariffPage(),
      },
    );
  }
}
