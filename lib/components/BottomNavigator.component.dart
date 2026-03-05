import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/providers/MainApp.provider.dart';
import 'package:provider/provider.dart';

class BottomNavigatorComponent extends StatelessWidget {
  const BottomNavigatorComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mainApp = context.watch<MainAppProvider>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // The border color
          width: 2.0, // The border width
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(70.0),
          topLeft: Radius.circular(70.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width * 0.13,
            child: GestureDetector(
              onTap: () => context.push('/main/home'),
              child: Column(
                children: [
                  Image.asset(fit: BoxFit.fitWidth, 'assets/images/house.png'),
                  Text(
                    'Inicio',
                    style: GoogleFonts.openSans(fontSize: 13.0),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.15,
            child: GestureDetector(
              onTap: () => context.push('/main/progress'),
              child: Column(
                children: [
                  Image.asset(fit: BoxFit.cover, 'assets/images/progress.webp'),
                  Text('Progreso', style: GoogleFonts.openSans(fontSize: 13.0))
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.13,
            child: GestureDetector(
              onTap: () => context.push('/main/profile'),
              child: Column(
                children: [
                  Image.asset(fit: BoxFit.cover, mainApp.profileData!.image),
                  Text('Perfil', style: GoogleFonts.openSans(fontSize: 13.0))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
