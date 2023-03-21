import 'package:flutter/material.dart';
import 'package:get_a_blanket/cell_number/cell_number_widget.dart';

class ReturnBlanketPage extends StatefulWidget {
  const ReturnBlanketPage({super.key});

  @override
  State<StatefulWidget> createState() => _ReturnBlanketPageState();
}

class _ReturnBlanketPageState extends State<ReturnBlanketPage> {
  // TODO проверка и передача данных
  @override
  Widget build(BuildContext context) {
    return const CellNumberWidget(
        cellNumber: 24, title: "ПОЛОЖИТЕ ПЛЕД В ЯЧЕЙКУ");
  }
}
