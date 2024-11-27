
import 'package:ecots_fe/screens/login_signup/verify_code_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/login_signup/button_green.dart';
import '../../components/login_signup/button_icon.dart';
import '../../constants/app_border.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controllers/auth_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  AuthController authController = Get.put(AuthController());

  bool _isLoading = false;

  Future<void> forgotPassword() async {
    final email = emailController.text;
    if (email.isEmpty) {
      final snackdemo = SnackBar(
        content: Text(
          'Vui lòng điền đầu đủ thông tin!',
          style: kLableW800White,
        ),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final success = await authController.forgotPassword(email);

    if (success) {
      Get.to(() => const VerifyCodeScreen());
    } else {
      final snackdemo = SnackBar(
        content: Text(
          'Tài khoản không tồn tại!',
          style: kLableW800White,
        ),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Forgot your password?', style: kLableTextBlackBig),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Don’t worry, happens to all of us. Enter your email below to recover your password.',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            contentPadding: borderRadiusTextField,
                            labelText: 'Email',
                            labelStyle: kLableTextBlackMinium,
                            focusedBorder: borderTextFieldFocus,
                            border: borderTextField),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: forgotPassword,
                        child: ButtonGreen(
                          isLoading: _isLoading,
                          title: 'Submit',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              height: 1.0,
                              indent: 2.0,
                              color: AppColors.stack,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or login with',
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      color: AppColors.stack, fontSize: 16)),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              height: 1.0,
                              color: AppColors.stack,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonIcon(icon: 'assets/icons/facebook_icon.svg'),
                          ButtonIcon(icon: 'assets/icons/google_icon.svg'),
                          ButtonIcon(icon: 'assets/icons/apple_icon.svg')
                        ],
                      )
                    ]))));
  }
}
