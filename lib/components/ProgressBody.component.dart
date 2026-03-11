import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/components/BodyView.component.dart';
import 'package:grit/providers/UserProfile.provider.dart';
import 'package:grit/theme/theme_extension.theme.dart';
import 'package:grit/widgets/CenteredGrid.widget.dart';

class ProgressBodyComponent extends ConsumerWidget {
  const ProgressBodyComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final user = ref.watch(userProvNotifierProvider);
    if (user == null)
      throw UnimplementedError('No user data to show on this widget!!');
    return BodyViewComponent(
      child: Column(
        children: [
          Text(
            'No te rindas!!!',
            style: GoogleFonts.openSans(
              fontSize: size.width / 16,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: context.colors.secondary,
            ),
          ),
          SizedBox(height: size.height / 32),
          CenteredGrid(
            itemWidth: size.width / 5,
            maxItemsPerRow: 3,
            spacing: size.width / 12,
            children: [
              for (int i = 0; i < user.rounds; i++)
                for (int j = 0; j < 4; j++)
                  _getInsign('assets/images/Insignia_${j + 1}.png'),

              for (int i = 0; i < (user.level ~/ 5); i++)
                _getInsign('assets/images/Insignia_${i + 1}.png'),
            ],
          ),
          for (int i = 0; i < user.rounds; i++) ...[
            SizedBox(height: size.height * 0.04),
            Image.asset('assets/images/Diploma.png', scale: 0.4),
          ],
          SizedBox(height: size.height * 0.1),
          Row(
            children: [
              Text(
                'Llevas ${user.level} días de rachas',
                style: GoogleFonts.openSans(
                  color: context.colors.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width / 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getInsign(String image) {
    return Image.asset(image, scale: 0.2);
  }
}
