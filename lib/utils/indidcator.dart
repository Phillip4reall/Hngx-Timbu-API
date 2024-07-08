import 'package:flutter/material.dart';

// used to indicate how many items are on the PageView, and also
// the current item being shown in the viewport.
class Indicator extends StatelessWidget {
  const Indicator({super.key, required this.isCurrent});
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6.0,
      width: isCurrent ? 30.0 : 8.0,
      decoration: BoxDecoration(
        color: isCurrent ? Colors.grey : Colors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
