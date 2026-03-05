import 'package:flutter/material.dart';
import 'package:grit/components/BottomNavigator.component.dart';
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
    final size = MediaQuery.of(context).size;
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
              SizedBox(height: size.height / 18),
              Expanded(child: widget.child),
              BottomNavigatorComponent(),
            ],
          ),
        ],
      ),
    );
  }
}
