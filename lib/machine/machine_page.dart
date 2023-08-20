import 'package:flutter/material.dart';
import 'package:get_a_blanket/phone_number/phone_number_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MachinePage extends StatefulWidget {
  const MachinePage({super.key, this.machineId});

  final int? machineId;

  @override
  State<StatefulWidget> createState() => _MachinePageState();
}

class _MachinePageState extends State<MachinePage> {
  void takeBlanketButtonPressed() {
    // TODO проверка и передача данных
    SharedPreferences.getInstance()
        .then((prefs) => prefs.setBool('takeBlanket', true));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PhoneNumberPage()));
  }

  void returnBlanketButtonPressed() {
    // TODO проверка и передача данных
    SharedPreferences.getInstance()
        .then((prefs) => prefs.setBool('takeBlanket', false));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PhoneNumberPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                // TODO забирать с сервера
                Image.network("/assets/assets/machine_photo_sample.jpg"),
                Text(
                  "Автомат на входе в парк горького",
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "ЧТО ВЫ ХОТИТЕ СДЕЛАТЬ?",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 70,
                ),
                IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: takeBlanketButtonPressed,
                        child: Text(
                          "ВЗЯТЬ ПЛЕД",
                          style: Theme.of(context).textTheme.labelLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: returnBlanketButtonPressed,
                        child: Text(
                          "ВЕРНУТЬ ПЛЕД",
                          style: Theme.of(context).textTheme.labelLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
