import 'package:flutter/material.dart';
import 'package:get_a_blanket/main.dart';

class CellNumberWidget extends StatefulWidget {
  const CellNumberWidget(
      {super.key, required this.cellNumber, required this.title});

  final int cellNumber;
  final String title;

  @override
  State<StatefulWidget> createState() => _CellNumberWidgetState();
}

class _CellNumberWidgetState extends State<CellNumberWidget> {
  void reloadAppButtonPressed() {
    RestartWidget.restartApp(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    widget.cellNumber.toString(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 42,
                        ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: reloadAppButtonPressed,
              child: Text(
                "ВЕРНУТЬСЯ К КАРТЕ",
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
