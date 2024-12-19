import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.icon, required this.name});

  final Icon icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(right: 14),
        child: icon,
      ),
      title: Text(
        name,
        style: const TextStyle(
          // fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      // tileColor: Colors.blue[50], // Background color for the tile
      onTap: () {},
    );
  }
}
