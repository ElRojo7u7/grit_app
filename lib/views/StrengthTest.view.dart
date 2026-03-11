import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/providers/UserProfile.provider.dart';
import 'package:grit/theme/theme_extension.theme.dart';

class StrengthTestView extends ConsumerWidget {
  static const opts = [
    'Constancia',
    'Disciplina',
    'Enfoque',
    'Esfuerzo',
    'Organización',
    'Motivación',
    'Compromiso',
  ];
  const StrengthTestView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Column(
            children: [
              Text(
                'Test de habilidades',
                style: GoogleFonts.openSans(
                  color: context.colors.primary,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                textAlign: TextAlign.center,
                '¿Cuál de estas habilidades va\n más contigo?',
                style: GoogleFonts.openSans(fontSize: 20.0),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30.0),
        Column(
          spacing: 30.0,
          children: [
            for (final (idx, item) in opts.indexed)
              GestureDetector(
                onTap: () {
                  ref
                      .read(userProvNotifierProvider.notifier)
                      .updateStrength(item);
                  context.go('/main');
                },
                child: Container(
                  width: double.infinity,
                  height: 40.0,
                  color: idx == 2 || idx == 4
                      ? Colors.amber
                      : idx % 2 == 0
                      ? context.colors.primary
                      : Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 40.0),
        Image.asset(scale: 5.0, 'assets/images/LogoEscuela.png'),
      ],
    );
  }
}
