import 'package:flutter/material.dart';
import 'package:grit/theme/theme_extension.theme.dart';

class TertiaryLayout extends StatefulWidget {
  final Widget child;
  const TertiaryLayout({super.key, required this.child});

  @override
  State<TertiaryLayout> createState() => _TertiaryLayoutState();
}

class _TertiaryLayoutState extends State<TertiaryLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.colors.primary.withAlpha(230),
                  Colors.amber.withAlpha(178),
                  Colors.white
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.25, 0.8],
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 50.0),
              widget.child,
              Spacer(),
              // TODO: Implementar barra de inicio
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Colors.grey, // The border color
              //       width: 2.0, // The border width
              //     ),
              //     borderRadius: BorderRadius.only(
              //       topRight: Radius.circular(70.0),
              //       topLeft: Radius.circular(70.0),
              //     ),
              //   ),
              //   child: Row(
              //     children: [
              //       Image.asset(scale: 15.0, 'assets/images/house.png')
              //       Text(data)
              //     ],
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }
}
