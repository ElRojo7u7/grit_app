import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grit/components/BodyView.component.dart';
import 'package:grit/providers/UserProfile.provider.dart';
import 'package:grit/widgets/AvatarOptions.widget.dart';

class ProfileSetupComponent extends StatefulWidget {
  const ProfileSetupComponent({super.key});

  @override
  State<ProfileSetupComponent> createState() => _ProfileSetupComponentState();
}

class _ProfileSetupComponentState extends State<ProfileSetupComponent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer(
      builder: (context, ref, child) {
        final userProv = ref.read(userProvNotifierProvider.notifier);
        final user = ref.watch(userProvNotifierProvider);
        return BodyViewComponent(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(scale: 5.0, 'assets/images/LogoEscuela.png'),
                  ],
                ),
                SizedBox(height: size.height * 0.025),
                TextFormField(
                  initialValue: user?.name,
                  decoration: const InputDecoration(
                    hintText: 'Nombre',
                    suffixIcon: Icon(Icons.mode_edit),
                    suffixIconColor: Color(0xFF99ABFF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF99ABFF)),
                    ),
                  ),
                  onSaved: (value) => userProv.updateName(value ?? ''),
                  validator: (value) =>
                      value == null || value.isEmpty || value.length < 3
                      ? 'Please enter a name'
                      : null,
                ),
                SizedBox(height: size.height * 0.01),
                _rowWithText(size, 'Objetivo'),
                SizedBox(height: size.height * 0.01),
                TextFormField(
                  initialValue: user?.goal,
                  decoration: const InputDecoration(
                    hintText: 'Tarea',
                    suffixIcon: Icon(Icons.mode_edit),
                    suffixIconColor: Color(0xFFEDBB6A),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFEDBB6A)),
                    ),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty || value.length < 3
                      ? 'Please enter a goal'
                      : null,
                  onSaved: (value) => userProv.updateGoal(value ?? ''),
                ),
                SizedBox(height: size.height * 0.01),
                SizedBox(
                  width: double.infinity,
                  height: size.height / 18,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      disabledBackgroundColor: Colors.grey,
                    ),
                    onPressed: _saveProfile,
                    child: Text(
                      'Configurar objetivo',
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width / 22,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                _rowWithText(size, 'Selecciona tu avatar'),
                SizedBox(height: size.height * 0.005),
                AvatarOptionsWidget(itemWidth: size.height / 12),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _rowWithText(Size size, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          margin: EdgeInsets.only(right: 5.0),
          child: Text(
            text,
            style: GoogleFonts.openSans(
              color: Color(0xFF5A5B64),
              fontWeight: FontWeight.bold,
              fontSize: size.width / 25,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 2.0,
            color: Color(0xFF5A5B64).withAlpha(127),
          ),
        ),
      ],
    );
  }
}
