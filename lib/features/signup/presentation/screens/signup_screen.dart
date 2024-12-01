import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/components/customtextfield.dart';
import 'package:itcores_internship_project/core/utils/app_icons.dart';
import 'package:itcores_internship_project/core/utils/app_strings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isvisible = false;
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void togglevisible() {
    setState(() {
      _isvisible = !_isvisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: AppIcons.arrowBack,
          onPressed: () {
            context.go('/onboarding');
          },
        ),
        centerTitle: true,
        title: Text(AppStrings.signUp,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            )),
      ),
      body: Form(
          key: _formkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NewCustomTextField(
                  hint: 'Name',
                  controller: nameController,
                  validationType: 'Name',
                ),
                NewCustomTextField(
                  hint: 'Email',
                  controller: emailController,
                  validationType: 'email',
                ),
                NewCustomTextField(
                  hint: 'Password',
                  controller: passwordController,
                  validationType: 'password',
                  obscure: !_isvisible,
                  icon: !_isvisible
                      ? IconButton(
                          onPressed: () {
                            togglevisible();
                          },
                          icon: AppIcons.invisible)
                      : IconButton(
                          onPressed: () {
                            togglevisible();
                          },
                          icon: AppIcons.visible),
                ),
              ],
            ),
          )),
    );
  }
}
