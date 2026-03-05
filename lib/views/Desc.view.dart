import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/theme/theme_extension.theme.dart';

class DescView extends StatelessWidget {
  const DescView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Column(
            children: [
              Text(
                '¿Que es GRIT?',
                style: GoogleFonts.openSans(
                  color: context.colors.primary,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                textAlign: TextAlign.justify,
                '''GRIT es un modelo creado por la psicóloga Angela Duckworth que explica el éxito a través del esfuerzo constante y la perseverancia.\n
“El esfuerzo cuenta el doble.”\n
Personas como Michael Jordan, J.K. Rowling y Steve Jobs aplicaron este principio para alcanzar sus objetivos.\n
En 21 Days on GRIT, usarás este modelo para avanzar día a día, cumplir retos y construir tu objetivo durante 21 días mediante rachas e insignias para impulsarte.''',
                style: GoogleFonts.openSans(fontSize: 15.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
