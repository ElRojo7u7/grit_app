import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/helpers/profiles.helper.dart';
import 'package:grit/providers/MainApp.provider.dart';
import 'package:grit/providers/RouteProvider.provider.dart';
import 'package:grit/theme/theme_extension.theme.dart';
import 'package:grit/widgets/CenteredGrid.widget.dart';
import 'package:provider/provider.dart';

class ChooseProfileView extends StatefulWidget {
  const ChooseProfileView({super.key});

  @override
  State<ChooseProfileView> createState() => _ChooseProfileViewState();
}

class _ChooseProfileViewState extends State<ChooseProfileView> {
  int selected = -1;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RouteProvider>().nextButtonAvailable = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mainApp = Provider.of<MainAppProvider>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Column(
            children: [
              Text(
                'ELIGE TU\nAVATAR',
                style: GoogleFonts.openSans(
                  color: context.colors.primary,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                textAlign: TextAlign.justify,
                '''En 21 Days on Grit puedes elegir uno de nuestros 5 avatares personalizados, creados por nosotros.\n 
Tu avatar te acompaña durante todo el proceso y representa tu progreso mientras avanzas hacia tu objetivo.
''',
                style: GoogleFonts.openSans(fontSize: 15.0),
              ),
            ],
          ),
        ),
        SafeArea(
          child: CenteredGrid(
            itemWidth: 90,
            maxItemsPerRow: 3,
            children: [
              for (final (idx, item) in profiles.indexed)
                GestureDetector(
                  onTap: () => setState(() {
                    selected = idx;
                    mainApp.profileData = item;
                    context.read<RouteProvider>().nextButtonAvailable = true;
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
          ),
        )
      ],
    );
  }
}
