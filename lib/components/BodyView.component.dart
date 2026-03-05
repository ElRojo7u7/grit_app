import 'package:flutter/material.dart';

class BodyViewComponent extends StatelessWidget {
  final Widget child;
  const BodyViewComponent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.all(size.width / 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: child,
    );
  }
}
