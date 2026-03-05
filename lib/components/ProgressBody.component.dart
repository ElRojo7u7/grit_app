import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/components/BodyView.component.dart';
import 'package:grit/theme/theme_extension.theme.dart';
import 'package:grit/widgets/CenteredGrid.widget.dart';

class ProgressBodyComponent extends StatelessWidget {
  const ProgressBodyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              for (int i = 0; i < 6; i++) _getCircle(context, size.width / 5)
            ],
          ),
          Spacer(),
          Row(
            children: [
              Text(
                'Llevas ? días de rachas',
                style: GoogleFonts.openSans(
                  color: context.colors.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width / 16,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _getCircle(BuildContext context, double width) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        color: context.colors.secondary,
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }
}
