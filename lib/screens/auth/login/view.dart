import 'package:admin_pnal/Helper/Btns.dart';
import 'package:admin_pnal/Helper/fluttertoast.dart';
import 'package:admin_pnal/Helper/text_form.dart';
import 'package:admin_pnal/screens/app_screen/view.dart';
import 'package:admin_pnal/screens/auth/login/bloc/bloc.dart';
import 'package:admin_pnal/screens/auth/login/bloc/events.dart';
import 'package:admin_pnal/screens/auth/login/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:kiwi/kiwi.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc bloc = KiwiContainer().resolve<LoginBloc>();
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: bloc.formKey,
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
                  controller: bloc.email,
                  context: context,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Email";
                    } else {
                      return null;
                    }
                  },
                  // onSaved: (o) {},
                  hintText: 'Email',
                  prefix: 'assets/icons/prefix-Phone.png',
                  enabled: true,
                  obscureText: false,
                  textInputType: TextInputType.emailAddress,
                ),
                txtField(
                  controller: bloc.password,
                  context: context,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "password";
                    } else {
                      return null;
                    }
                  },
                  // onSaved: (o) {},
                  hintText: 'password',
                  prefix: 'assets/icons/prefix-Phone.png',
                  enabled: true,
                  obscureText: false,
                  textInputType: TextInputType.emailAddress,
                ),
                BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is LoginStateSuccess) {
                      showMassege(
                        text: 'تم تسجيل الدخول',
                        state: ToastStates.SUCCESS,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SidebarXExampleApp(),
                        ),
                      );
                    } else if (state is LoginStateFailde) {
                      showMassege(
                        text: state.msg,
                        state: ToastStates.SUCCESS,
                      );
                    }
                  },
                  builder: (context, state) {
                    return btn(
                      context: context,
                      txt: "تسجيل الدخول",
                      onTap: () {
                        setState(() {
                          if (!bloc.formKey.currentState!.validate()) {
                            return;
                          } else {
                            bloc.formKey.currentState!.save();
                            bloc.add(
                              LoginEventsStart(
                                email: bloc.email.text,
                                password: bloc.password.text,
                              ),
                            );
                          }
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
