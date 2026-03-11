import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/components/ProfileSetup.component.dart';
import 'package:grit/providers/UserProfile.provider.dart';
import 'package:grit/theme/theme_extension.theme.dart';

class ProfileSetupView extends ConsumerWidget {
  const ProfileSetupView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final user = ref.watch(userProvNotifierProvider);
    if (user == null)
      throw UnimplementedError("No user to show in this widget!!");
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: size.height / 16,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => context.push('/main/home'),
                icon: Icon(Icons.arrow_back, size: 30.0),
                color: context.colors.primary,
              ),
              Text(
                'Mi Perfil',
                style: GoogleFonts.openSans(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.check_circle, size: 30.0, color: Colors.white),
            ],
          ),
        ),
        SizedBox(height: size.height / 64),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                    top: constraints.maxHeight * 0.16,
                    child: ProfileSetupComponent(),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.35,
                        child: Image.asset(user.image),
                      ),
                      Text(
                        user.name,
                        style: GoogleFonts.openSans(
                          fontSize: constraints.maxHeight / 40,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
