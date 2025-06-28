import 'package:flutter/material.dart';

class MyDrawerButton extends StatelessWidget {
  const MyDrawerButton({super.key, required this.onPressed});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "Drawer",
      mini: true,
      onPressed: onPressed,
      backgroundColor: Colors.white,
      child: const Icon(
        Icons.menu,
        color: Colors.black,
        size: 25,
      ),
    );
  }
}
