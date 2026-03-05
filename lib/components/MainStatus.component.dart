import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/components/BodyView.component.dart';
import 'package:grit/providers/MainApp.provider.dart';
import 'package:provider/provider.dart';

class MainStatusComponent extends StatefulWidget {
  const MainStatusComponent({super.key});

  @override
  State<MainStatusComponent> createState() => _MainStatusComponentState();
}

class _MainStatusComponentState extends State<MainStatusComponent> {
  @override
  Widget build(BuildContext context) {
    final mainApp = Provider.of<MainAppProvider>(context);
    final size = MediaQuery.of(context).size;
    return BodyViewComponent(
      child: Column(
        children: [
          SizedBox(height: 20.0),
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
              const SizedBox(width: 15.0),
              Expanded(
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Escribe tu objetivo',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
            ),
            child: Text(
              'MARCAR COMO HECHO',
              style: GoogleFonts.openSans(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          const SizedBox(height: 30.0),
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
                          fit: BoxFit.contain, 'assets/images/task.jpeg'),
                    ),
                    Text(
                      'Días\nCompletados',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w900,
                        fontSize: size.width / 30,
                      ),
                    ),
                    Text(
                      '${mainApp.profileData!.level == 0 ? 0 : mainApp.profileData!.level}',
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
                      fontSize: size.width / 30,
                    ),
                  ),
                  Text(
                    '0',
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
                      fontSize: size.width / 30,
                    ),
                  ),
                  Text(
                    '0',
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
          const SizedBox(height: 20.0),
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
          const SizedBox(height: 10.0),
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
        ],
      ),
    );
  }
}
