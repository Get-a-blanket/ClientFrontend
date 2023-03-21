import 'package:flutter/material.dart';
import 'package:get_a_blanket/cell_number/cell_number_widget.dart';

class TakeBlanketPage extends StatefulWidget {
  const TakeBlanketPage({super.key});

  @override
  State<StatefulWidget> createState() => _TakeBlanketPageState();
}

class _TakeBlanketPageState extends State<TakeBlanketPage> {
  // TODO проверка и передача данных
  @override
  Widget build(BuildContext context) {
    return const CellNumberWidget(
        cellNumber: 15, title: "ВОЗЬМИТЕ ПЛЕД ИЗ ЯЧЕЙКИ");
  }
}
