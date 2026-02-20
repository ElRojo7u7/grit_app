import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40.0),
      ),
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
              // Image.asset(scale: 2, 'assets/images/Hammer.png'),
              const SizedBox(width: 15.0),
              Expanded(
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '30 minutos de ejercicio',
                  ),
                ),
              ),
              // RichText(
              //   textAlign: TextAlign.left,
              //   text: TextSpan(
              //     text: '',
              //     style: GoogleFonts.openSans(
              //       color: Colors.black,
              //       fontSize: 25.0,
              //     ),
              //     children: [
              //       // TextSpan(
              //       //   text: '30',
              //       //   style: GoogleFonts.openSans(
              //       //     fontWeight: FontWeight.bold,
              //       //   ),
              //       // ),
              //       // TextSpan(
              //       //   text: ' minutos de ejercicio',
              //       //   style: GoogleFonts.openSans(
              //       //     color: Colors.black,
              //       //   ),
              //       // ),
              //     ],
              //   ),
              // ),
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
              Column(
                children: [
                  Image.asset(scale: 6, 'assets/images/task.jpeg'),
                  Text(
                    'Días\nCompletados',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w900,
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    '${mainApp.profileData.level == 0 ? 0 : mainApp.profileData.level}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w900,
                      fontSize: 22.0,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(scale: 1.7, 'assets/images/insign.webp'),
                  Text(
                    'Insignias\nObtenidas',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w900,
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    '0',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w900,
                      fontSize: 22.0,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 10.0),
                  Image.asset(scale: 1.5, 'assets/images/diploma.webp'),
                  Text(
                    'Insignias\nObtenidas',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w900,
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    '0',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w900,
                      fontSize: 22.0,
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
          )
        ],
      ),
    );
  }
}
