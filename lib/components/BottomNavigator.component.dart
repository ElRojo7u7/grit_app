import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/providers/UserProfile.provider.dart';

class BottomNavigatorComponent extends ConsumerWidget {
  const BottomNavigatorComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final user = ref.watch(userProvNotifierProvider);
    final currRoute = GoRouterState.of(context).uri.toString();
    if (user == null)
      throw UnimplementedError("No user data to show in this widget!!");
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
              onTap: () =>
                  currRoute == '/main/home' ? null : context.push('/main/home'),
              child: Column(
                children: [
                  Image.asset(fit: BoxFit.fitWidth, 'assets/images/house.png'),
                  Text(
                    'Inicio',
                    style: GoogleFonts.openSans(fontSize: size.width / 32),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.15,
            child: GestureDetector(
              onTap: () => currRoute == '/main/progress'
                  ? null
                  : context.push('/main/progress'),
              child: Column(
                children: [
                  Image.asset(fit: BoxFit.cover, 'assets/images/progress.webp'),
                  Text(
                    'Progreso',
                    style: GoogleFonts.openSans(fontSize: size.width / 32),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.13,
            child: GestureDetector(
              onTap: () => currRoute == '/main/profile'
                  ? null
                  : context.push('/main/profile'),
              child: Column(
                children: [
                  Image.asset(fit: BoxFit.cover, user.image),
                  Text(
                    'Perfil',
                    style: GoogleFonts.openSans(fontSize: size.width / 32),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
