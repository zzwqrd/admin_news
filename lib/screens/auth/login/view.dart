import 'package:admin_pnal/Helper/text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0.w, 30.h, 0.w, 30.h),
                child: const Text(
                  'LOGO',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              txtField(
                controller: null,
                context: context,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Email";
                  } else {
                    return null;
                  }
                },
                onSaved: (o) {},
                hintText: 'Email',
                prefix: 'assets/icons/prefix-Phone.png',
                enabled: true,
                obscureText: false,
                textInputType: TextInputType.emailAddress,
              ),
              txtField(
                controller: null,
                context: context,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "password";
                  } else {
                    return null;
                  }
                },
                onSaved: (o) {},
                hintText: 'password',
                prefix: 'assets/icons/prefix-Phone.png',
                enabled: true,
                obscureText: false,
                textInputType: TextInputType.emailAddress,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
