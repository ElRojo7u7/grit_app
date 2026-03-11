import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/theme/theme_extension.theme.dart';
import 'package:grit/widgets/AvatarOptions.widget.dart';

class ChooseProfileView extends StatelessWidget {
  const ChooseProfileView({super.key});

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
                'ELIGE TU AVATAR',
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
                '''En 21 Days on GRIT puedes elegir uno de nuestros 5 avatares personalizados, creados por nosotros.\n 
Tu avatar te acompaña durante todo el proceso y representa tu progreso mientras avanzas hacia tu objetivo.
''',
                style: GoogleFonts.openSans(fontSize: size.width / 25),
              ),
            ],
          ),
        ),
        AvatarOptionsWidget(itemWidth: size.height / 10),
      ],
    );
  }
}
