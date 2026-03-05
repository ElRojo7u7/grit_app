import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/main.dart';
import 'package:grit/providers/AvatarOptions.provider.dart';
import 'package:grit/theme/theme_extension.theme.dart';
import 'package:provider/provider.dart';

class SecondaryLayout extends StatefulWidget {
  final Widget child;
  const SecondaryLayout({super.key, required this.child});

  @override
  State<SecondaryLayout> createState() => _SecondaryLayoutState();
}

class _SecondaryLayoutState extends State<SecondaryLayout> {
  @override
  Widget build(BuildContext context) {
    final route = Provider.of<AvatarProvider>(context);
    final size = MediaQuery.of(context).size;
    final path = GoRouterState.of(context).uri.path;
    final viewData = routeData[path];
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 90.0),
          widget.child,
          Spacer(),
          ElevatedButton(
            onPressed: () =>
                route.avatarSelected ? context.go(viewData!.nextRoute) : null,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  route.avatarSelected ? context.colors.primary : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15.0), // Adjust the radius as needed
              ),
            ),
            child: Text(
              'Siguiente Página',
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Image.asset(scale: 5.0, 'assets/images/LogoEscuela.png'),
          const SizedBox(height: 10.0),
          Container(
            height: 30.0,
            width: size.width,
            color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12.0,
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: viewData!.idx == i ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  )
              ],
            ),
          ),
          const SizedBox(height: 50.0)
        ],
      ),
    );
  }
}
