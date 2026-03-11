import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/main.dart';
import 'package:grit/theme/theme_extension.theme.dart';

class SecondaryLayout extends ConsumerWidget {
  final Widget child;
  const SecondaryLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final path = GoRouterState.of(context).uri.path;
    final available = ref.watch(layerNotifProvider);
    final viewData = routeData[path];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 90.0),
          child,
          Spacer(),
          ElevatedButton(
            onPressed: () => available ? context.go(viewData!.nextRoute) : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: available ? context.colors.primary : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  15.0,
                ), // Adjust the radius as needed
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
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}

class _RouteNotifier extends Notifier<bool> {
  @override
  bool build() => true;

  void available() => state = true;
  void unavailable() => state = false;
}

final layerNotifProvider = NotifierProvider<_RouteNotifier, bool>(
  _RouteNotifier.new,
);
