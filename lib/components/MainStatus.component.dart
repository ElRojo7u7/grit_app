import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/components/BodyView.component.dart';
import 'package:grit/helpers/DateTime.helper.dart';
import 'package:grit/providers/UserProfile.provider.dart';

class MainStatusComponent extends ConsumerWidget {
  const MainStatusComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final user = ref.watch(userProvNotifierProvider);
    if (user == null)
      throw UnimplementedError("No user data to show in this widget!!");
    final userProv = ref.read(userProvNotifierProvider.notifier);
    if (user.levelUpdate != null &&
        getNow().difference(user.levelUpdate!).inDays == 2)
      userProv.reset();
    final markChecked = user.levelUpdate != getNow();
    return BodyViewComponent(
      child: Column(
        children: [
          SizedBox(height: size.height / 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(scale: 5.0, 'assets/images/LogoEscuela.png'),
            ],
          ),
          Row(
            children: [
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  text: '',
                  style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontSize: 30.0,
                  ),
                  children: [
                    TextSpan(
                      text: 'Reto',
                      style: GoogleFonts.openSans(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' del día:',
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: size.width / 20),
              Expanded(
                child: Text(
                  user.goal ?? 'Configura un objetivo en tu perfil',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width / 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height / 40),
          ElevatedButton(
            onPressed: () => markChecked ? userProv.incrementLevel() : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: markChecked ? Colors.amber : Colors.grey,
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
            ),
            child: Text(
              'MARCAR COMO HECHO',
              style: GoogleFonts.openSans(
                color: markChecked ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: size.width / 22,
              ),
            ),
          ),
          SizedBox(height: size.height / 32),
          Row(
            spacing: 35.0,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.24,
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width * 0.13,
                      child: Image.asset(
                        fit: BoxFit.contain,
                        'assets/images/task.jpeg',
                      ),
                    ),
                    Text(
                      'Días\nCompletados',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w900,
                        fontSize: size.width / 32,
                      ),
                    ),
                    Text(
                      '${user.level == 0 ? 0 : user.level}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w900,
                        fontSize: size.width / 19,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: size.width * 0.13,
                    child: Image.asset(
                      fit: BoxFit.cover,
                      'assets/images/insign.webp',
                    ),
                  ),
                  Text(
                    'Insignias\nObtenidas',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w900,
                      fontSize: size.width / 32,
                    ),
                  ),
                  Text(
                    '${user.level ~/ 5 + user.rounds * 4}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w900,
                      fontSize: size.width / 19,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: size.width * 0.13,
                    child: Image.asset(
                      fit: BoxFit.cover,
                      'assets/images/diploma.webp',
                    ),
                  ),
                  Text(
                    'Diplomas\nObtenidos',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w900,
                      fontSize: size.width / 32,
                    ),
                  ),
                  Text(
                    '${user.rounds}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w900,
                      fontSize: size.width / 19,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: size.height / 40),
          Row(
            children: [
              Text(
                'Consejo del día:',
                style: GoogleFonts.openSans(
                  color: const Color(0xFF5D0700),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height / 50),
          Row(
            children: [
              Text(
                'La constancia supera a la motivación.',
                style: GoogleFonts.openSans(
                  color: const Color(0xFF5D0700),
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height / 50),
        ],
      ),
    );
  }
}
