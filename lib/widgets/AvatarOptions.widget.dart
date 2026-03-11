import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/layouts/Secondary.layout.dart';
import 'package:grit/providers/UserProfile.provider.dart';
import 'package:grit/theme/theme_extension.theme.dart';
import 'package:grit/widgets/CenteredGrid.widget.dart';
import 'package:grit/helpers/profiles.helper.dart';

class AvatarOptionsWidget extends ConsumerStatefulWidget {
  final double itemWidth;
  const AvatarOptionsWidget({super.key, this.itemWidth = 90});

  @override
  ConsumerState<AvatarOptionsWidget> createState() =>
      _AvatarOptionsWidgetState();
}

class _AvatarOptionsWidgetState extends ConsumerState<AvatarOptionsWidget> {
  int selected = -1;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(layerNotifProvider.notifier).unavailable();
    });
    final user = ref.read(userProvNotifierProvider);
    if (user != null) selected = user.index;
  }

  @override
  Widget build(BuildContext context) {
    return CenteredGrid(
      itemWidth: widget.itemWidth,
      maxItemsPerRow: 3,
      children: [
        for (final (idx, item) in profiles.indexed)
          GestureDetector(
            onTap: () => setState(() {
              selected = idx;
              ref
                  .read(userProvNotifierProvider.notifier)
                  .setDefaultProfile(idx);
              ref.read(layerNotifProvider.notifier).available();
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
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
