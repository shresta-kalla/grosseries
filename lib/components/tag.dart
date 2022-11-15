import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String text;

  const Tag({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 100),
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Center(
          child: Text(text, style: const TextStyle(color: Colors.black))),
    );
  }
}
