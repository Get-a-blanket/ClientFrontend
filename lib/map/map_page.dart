import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import '../machine_code/machine_code_page.dart';
import 'map_widget.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  void codeButtonPressed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MachineCodePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MapWidget(),
        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(32),
          child: PointerInterceptor(
            child: ElevatedButton(
              onPressed: codeButtonPressed,
              child: Text(
                "ВВЕСТИ КОД АВТОМАТА",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 20,
              vertical: MediaQuery.of(context).size.height / 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "GET A BLANKET",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 50,
              ),
              Image.asset(
                "assets/fond_pic.png",
                height: 48,
              )
            ],
          ),
        ),
      ],
    );
  }
}
