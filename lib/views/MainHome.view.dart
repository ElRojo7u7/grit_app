import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/components/MainStatus.component.dart';
import 'package:grit/providers/UserProfile.provider.dart';

class MainHomeView extends ConsumerWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final user = ref.watch(userProvNotifierProvider);
    if (user == null)
      throw UnimplementedError('No user data to show in this widget!!');
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 10.0),
            _getBar(size),
            Spacer(),
            RichText(
              text: TextSpan(
                text: ' ',
                style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 35.0,
                ),
                children: [
                  TextSpan(
                    text: '21',
                    style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' Days on',
                    style: GoogleFonts.openSans(color: Colors.black),
                  ),
                  TextSpan(
                    text: ' GRIT',
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            _getBar(size),
            const SizedBox(width: 10.0),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: '',
                style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 30.0,
                ),
                children: [
                  TextSpan(
                    text: 'Día',
                    style: GoogleFonts.openSans(color: Colors.black),
                  ),
                  TextSpan(
                    text: ' ${user.level}',
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' de ',
                    style: GoogleFonts.openSans(color: Colors.black),
                  ),
                  TextSpan(
                    text: '21',
                    style: GoogleFonts.openSans(
                      color: Colors.white,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: '',
                style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 30.0,
                ),
                children: [
                  TextSpan(
                    text: 'Activa la ',
                    style: GoogleFonts.openSans(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'racha',
                    style: GoogleFonts.openSans(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10.0),
            Image.asset(scale: 8.0, 'assets/images/Fire.png'),
          ],
        ),
        SizedBox(height: size.height / 24),
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 20.0,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
            TweenAnimationBuilder<double>(
              tween: Tween(
                begin: user.level != 0 ? (user.level - 1) * size.width / 21 : 0,
                end: user.level * size.width / 21,
              ),
              duration: Duration(milliseconds: 400),
              builder: (context, width, child) {
                return Container(
                  width: width,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(height: size.height / 64),
        Expanded(child: MainStatusComponent()),
      ],
    );
  }

  Widget _getBar(Size size) {
    return Container(height: 3.0, width: size.width * 0.10, color: Colors.red);
  }
}
