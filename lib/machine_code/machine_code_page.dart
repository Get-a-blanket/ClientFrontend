import 'package:event/event.dart';
import 'package:eventsubscriber/eventsubscriber.dart';
import 'package:flutter/material.dart';
import 'package:get_a_blanket/machine/machine_page.dart';
import 'package:get_a_blanket/num_keyboard/num_keyboard_widget.dart';

class MachineCodePage extends StatefulWidget {
  const MachineCodePage({super.key});

  @override
  State<StatefulWidget> createState() => _MachineCodePageState();
}

class _MachineCodePageState extends State<MachineCodePage> {
  final int length = 3;

  List<Container> numbersWidgets(EventData? args) {
    List<Container> list = args?.nums
            .map(
              (number) => Container(
                alignment: Alignment.center,
                width: 40,
                child: Text(
                  number.toString(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 30),
                ),
              ),
            )
            .toList() ??
        <Container>[];
    while (list.length < length) {
      list.add(Container(
        alignment: Alignment.center,
        width: 40,
        child: Text(
          "__",
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary, fontSize: 30),
        ),
      ));
    }
    return list;
  }

  void okButtonOnPressed(EventData? args) {
    // TODO проверка и передача данных
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MachinePage()));
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
                      "ВВЕДИТЕ КОД АВТОМАТА",
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
