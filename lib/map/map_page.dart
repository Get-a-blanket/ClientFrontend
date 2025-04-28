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

  static const aboutText =
      """Проект создан при поддержке Федерального государственного бюджетного учреждения "Фонд содействия развитию малых форм предприятий в научно-технической сфере" в рамках программы "Студенческий стартап" федерального проекта "Платформа университетского технологического предпринимательства"


Get a Blanket — это инновационный сервис аренды пледов через вендинговые автоматы. Мы создаем удобные решения для вашего комфорта на прогулках, в парках, на фестивалях и других мероприятиях. Аренда осуществляется с помощью мобильного сайта и QR-кода, размещённого на автомате.

Контакты:
Генеральный директор: Сабина Атаева
Email: svataeva@edu.hse.ru
Телефон: +7 (916)857 36-38""";

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
          child: PointerInterceptor(
            child: GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
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
                  Text(
                    "узнать о нас больше",
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PointerInterceptor(
                      child: Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                aboutText,
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              TextButton(
                                child: const Text("Закрыть"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
