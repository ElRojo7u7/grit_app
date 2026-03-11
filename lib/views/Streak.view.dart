import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/theme/theme_extension.theme.dart';

class StreakView extends StatelessWidget {
  const StreakView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Column(
            children: [
              Text(
                'Rachas',
                style: GoogleFonts.openSans(
                  color: context.colors.primary,
                  fontSize: size.width / 10,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: size.width / 20),
              Text(
                textAlign: TextAlign.justify,
                '''Las rachas te ayudan a mantener tu progreso día con día.\n
Cada vez que completas tu reto diario, tu racha continúa creciendo.\n
En 21 Days on GRIT, las rachas te acompañan durante 21 días y muestran tu constancia mientras avanzas hacia tu objetivo.
''',
                style: GoogleFonts.openSans(fontSize: size.width / 25),
              ),
            ],
          ),
        ),
        Image.asset(scale: 1.0, 'assets/images/Fire.png'),
      ],
    );
  }
}
