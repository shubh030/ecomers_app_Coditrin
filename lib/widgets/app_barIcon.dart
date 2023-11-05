import 'package:flutter/material.dart';

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({
    Key? key,
    required this.function,
    this.icon,
    this.imagePath,
  }) : super(key: key);

  final Function function;
  final IconData? icon;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
          decoration: BoxDecoration(
           
             borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).cardColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: icon != null
                ? Icon(icon)
                : imagePath != null
                    ? Image.asset(
                        imagePath.toString(),
                        width: 34, // Adjust the width as needed
                        height: 34, // Adjust the height as needed
                      )
                    : Container(), // You can replace this with a placeholder or other behavior
          ),
        ),
      ),
    );
  }
}
