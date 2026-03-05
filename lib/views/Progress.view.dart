import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/components/ProgressBody.component.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          'Progreso',
          style: GoogleFonts.openSans(
            fontSize: size.width / 8,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
        SizedBox(height: size.height / 32),
        Expanded(child: ProgressBodyComponent())
      ],
    );
  }
}
