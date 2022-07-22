import 'package:flutter/material.dart';

class CustomerInput extends StatelessWidget {
  const CustomerInput(
      {Key? key,
      required this.customerInputWidth,
      this.customerInputMargin = const EdgeInsets.all(0.0)})
      : super(key: key);

  final double customerInputWidth;

  final EdgeInsets customerInputMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
            initialValue: "",
            decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 98, 98, 98),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(27.4),
                    borderSide: BorderSide.none),
                filled: true,
                prefixIcon: const Icon(Icons.search, color: Colors.black)),
            cursorColor: Colors.black),
        width: customerInputWidth,
        margin: customerInputMargin);
  }
}
