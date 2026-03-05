import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/providers/MainApp.provider.dart';
import 'package:grit/providers/AvatarOptions.provider.dart';
import 'package:grit/theme/theme_extension.theme.dart';
import 'package:grit/widgets/CenteredGrid.widget.dart';
import 'package:provider/provider.dart';
import 'package:grit/helpers/profiles.helper.dart';

class AvatarOptionsWidget extends StatefulWidget {
  final double itemWidth;
  const AvatarOptionsWidget({super.key, this.itemWidth = 90});

  @override
  State<AvatarOptionsWidget> createState() => _AvatarOptionsWidgetState();
}

class _AvatarOptionsWidgetState extends State<AvatarOptionsWidget> {
  int selected = -1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AvatarProvider>().avatarSelected = false;
    });
    selected = context.read<MainAppProvider>().profileData?.index ?? -1;
  }

  @override
  Widget build(BuildContext context) {
    final mainApp = context.read<MainAppProvider>();

    return CenteredGrid(
      itemWidth: widget.itemWidth,
      maxItemsPerRow: 3,
      children: [
        for (final (idx, item) in profiles.indexed)
          GestureDetector(
            onTap: () => setState(() {
              selected = idx;
              mainApp.profileData = item;
              context.read<AvatarProvider>().avatarSelected = true;
            }),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: selected == idx
                      ? context.colors.primary
                      : Colors.transparent,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Image.asset(fit: BoxFit.fill, item.image),
                  const SizedBox(height: 5.0),
                  Text(
                    item.name,
                    style: GoogleFonts.openSans(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          )
      ],
    );
  }
}
