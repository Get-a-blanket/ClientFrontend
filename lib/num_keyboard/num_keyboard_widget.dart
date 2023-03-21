import 'package:event/event.dart';
import 'package:flutter/material.dart';
import 'package:get_a_blanket/num_keyboard/num_keyboard_button.dart';

class NumKeyboard extends StatefulWidget {
  const NumKeyboard(
      {super.key,
      required this.event,
      required this.length,
      required this.eventOk});

  final Event<EventData> event;
  final int length;
  final Event<EventData> eventOk;

  @override
  State<StatefulWidget> createState() => _NumKeyboardState();
}

class EventData extends EventArgs {
  List<int> nums;

  EventData(this.nums);
}

class _NumKeyboardState extends State<NumKeyboard> {
  final List<int> _list = <int>[];

  void _buttonAddFunc(int num) {
    if (_list.length < widget.length) {
      _list.add(num);
      widget.event.broadcast(EventData(_list));
    }
  }

  void _buttonBackspaceFunc() {
    if (_list.isNotEmpty) {
      _list.removeLast();
      widget.event.broadcast(EventData(_list));
    }
  }

  void _buttonOkFunc() {
    if (_list.length == widget.length) {
      widget.eventOk.broadcast(EventData(_list));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          NumKeyboardButton(
            func: () {
              _buttonAddFunc(1);
            },
            color: Theme.of(context).colorScheme.onPrimary,
            str: "1",
          ),
          NumKeyboardButton(
            func: () {
              _buttonAddFunc(2);
            },
            color: Theme.of(context).colorScheme.onPrimary,
            str: "2",
          ),
          NumKeyboardButton(
            func: () {
              _buttonAddFunc(3);
            },
            color: Theme.of(context).colorScheme.onPrimary,
            str: "3",
          ),
        ]),
        TableRow(children: [
          NumKeyboardButton(
            func: () {
              _buttonAddFunc(4);
            },
            color: Theme.of(context).colorScheme.onPrimary,
            str: "4",
          ),
          NumKeyboardButton(
            func: () {
              _buttonAddFunc(5);
            },
            color: Theme.of(context).colorScheme.onPrimary,
            str: "5",
          ),
          NumKeyboardButton(
            func: () {
              _buttonAddFunc(6);
            },
            color: Theme.of(context).colorScheme.onPrimary,
            str: "6",
          ),
        ]),
        TableRow(children: [
          NumKeyboardButton(
            func: () {
              _buttonAddFunc(7);
            },
            color: Theme.of(context).colorScheme.onPrimary,
            str: "7",
          ),
          NumKeyboardButton(
            func: () {
              _buttonAddFunc(8);
            },
            color: Theme.of(context).colorScheme.onPrimary,
            str: "8",
          ),
          NumKeyboardButton(
            func: () {
              _buttonAddFunc(9);
            },
            color: Theme.of(context).colorScheme.onPrimary,
            str: "9",
          ),
        ]),
        TableRow(children: [
          NumKeyboardButton(
            func: () {
              _buttonBackspaceFunc();
            },
            color: Theme.of(context).colorScheme.secondary,
            icon: const Icon(Icons.backspace_outlined),
          ),
          NumKeyboardButton(
            func: () {
              _buttonAddFunc(0);
            },
            color: Theme.of(context).colorScheme.onPrimary,
            str: "0",
          ),
          NumKeyboardButton(
            func: () {
              _buttonOkFunc();
            },
            color: Theme.of(context).colorScheme.secondary,
            icon: const Icon(Icons.check),
          ),
        ]),
      ],
    );
  }
}
