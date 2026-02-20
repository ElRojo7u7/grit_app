import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/theme/theme_extension.theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: context.colors.background,
      width: 10,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.push('/intro'),
            child: Container(
              height: size.height * 0.8,
              width: size.width * 0.4,
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(scale: 5.0, 'assets/images/LogoEscuela.png'),
                      const SizedBox(
                        width: 10.0,
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Text(
                        'Iniciar',
                        style: GoogleFonts.interTight(
                          fontWeight: FontWeight.normal,
                          fontSize: 25.0,
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      const Icon(
                        Icons.add_reaction,
                        size: 30.0,
                      ),
                      const SizedBox(width: 20.0),
                    ],
                  ),
                  const Spacer()
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to 21\n DAYS on GRIT',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  'by: Luisa, Johana & Mateo',
                  style: GoogleFonts.openSans(
                    fontSize: 10.0,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
