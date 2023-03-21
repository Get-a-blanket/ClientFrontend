import 'package:flutter/material.dart';

class NumKeyboardButton extends StatefulWidget {
  const NumKeyboardButton(
      {super.key,
      this.icon,
      this.str,
      required this.func,
      required this.color});

  final Icon? icon;
  final String? str;
  final Function()? func;
  final Color color;

  @override
  State<StatefulWidget> createState() => _NumKeyboardButtonState();
}

class _NumKeyboardButtonState extends State<NumKeyboardButton> {
  @override
  Widget build(BuildContext context) {
    Widget child = widget.icon ??
        Text(
          widget.str ?? "",
          style: Theme.of(context).textTheme.labelMedium,
        );
    return Container(
      height: 67,
        padding: const EdgeInsets.all(6),
        child: ElevatedButton(
          onPressed: widget.func,
          style: ElevatedButton.styleFrom(
              backgroundColor: widget.color,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              padding: const EdgeInsets.all(10)),
          child: child,
        ));
  }
}
