import 'package:flutter/material.dart';
import 'package:get_a_blanket/cell_number/return_blanket_page.dart';
import 'package:get_a_blanket/cell_number/take_blanket_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TariffPage extends StatefulWidget {
  const TariffPage({super.key});

  @override
  State<StatefulWidget> createState() => _TariffPageState();
}

class TariffData {
  TariffData(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.unit});

  final int id;
  final String name;
  final String description;
  final double price;
  final String unit;

  TariffData.fromJSON(Map dict)
      : id = dict["id"],
        name = dict["name"],
        description = dict["description"],
        price = dict["price"],
        unit = dict["unit"];
}

class _TariffPageState extends State<TariffPage> {
  // TODO проверка и передача данных
  final List<TariffData> _data = [
    TariffData.fromJSON({
      "id": 1,
      "name": "Почасовой тариф",
      "description": "Стоимость списывается с карты каждый час",
      "price": 99.0,
      "unit": "₽ в час"
    }),
    TariffData.fromJSON({
      "id": 2,
      "name": "Суточный тариф",
      "description": "Стоимость списывается 1 раз за сутки",
      "price": 249.0,
      "unit": "₽"
    }),
  ];

  TariffData? _selectedTariff;

  void setTariff(TariffData? value) {
    setState(() {
      _selectedTariff = value;
    });
  }

  Widget getColumnFromData(List<TariffData> data) {
    _selectedTariff ??= _data[0];
    return Column(
      children: data
          .map((element) => Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: ListTile(
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      element.name,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      element.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          element.price.round().toString(), // Округление до целого !!!
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          element.unit,
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
                leading: Radio<TariffData>(
                  value: element,
                  groupValue: _selectedTariff,
                  onChanged: setTariff,
                ),
                onTap: () {
                  setTariff(element);
                },
              )))
          .toList(),
    );
  }

  void payButtonPressed() async {
    // TODO система оплаты
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('takeBlanket')!) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const TakeBlanketPage()));
    } else {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ReturnBlanketPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "ВЫБЕРИТЕ ТАРИФ",
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 6),
                    child: getColumnFromData(_data),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: payButtonPressed,
              child: Text(
                "ОПЛАТИТЬ",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
