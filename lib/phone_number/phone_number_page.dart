import 'package:eventsubscriber/eventsubscriber.dart';
import 'package:flutter/material.dart';
import 'package:get_a_blanket/phone_number/phone_number_code_page.dart';
import '../machine/machine_page.dart';
import '../num_keyboard/num_keyboard_widget.dart';
import 'package:event/event.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<StatefulWidget> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  final int length = 10;

  List<Container> numbersWidgets(EventData? args) {
    Text getTextWidget(String str) {
      return Text(
        str,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary, fontSize: 18),
        textAlign: TextAlign.center,
      );
    }

    Container getContainer(String str, {double width = 20}) {
      return Container(
          alignment: Alignment.center, width: width, child: getTextWidget(str));
    }

    List<Container> list =
        args?.nums.map((number) => getContainer(number.toString())).toList() ??
            <Container>[];
    while (list.length < length) {
      list.add(getContainer("__"));
    }
    return <Container>[
      getContainer("+7", width: 30),
      getContainer("(", width: 10),
      list[0],
      list[1],
      list[2],
      getContainer(")", width: 10),
      list[3],
      list[4],
      list[5],
      getContainer('-', width: 10),
      list[6],
      list[7],
      getContainer('-', width: 10),
      list[8],
      list[9],
    ];
  }

  void okButtonOnPressed(EventData? args) {
    // TODO проверка и передача данных
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const PhoneNumberCodePage()));
  }

  @override
  Widget build(BuildContext context) {
    Event<EventData> event = Event();
    Event<EventData> eventOk = Event();
    eventOk.subscribe(okButtonOnPressed);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "ВВЕДИТЕ НОМЕР ТЕЛЕФОНА",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.onPrimary),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    EventSubscriber(
                      event: event,
                      builder: (context, args) => Container(
                        height: 50,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: numbersWidgets(args),
                        ),
                        // Text(
                        //     args?.nums.map((e) => e.toString()).join('') ?? ""),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child:
                  NumKeyboard(event: event, length: length, eventOk: eventOk),
            ),
          ],
        ),
      ),
    );
  }
}
