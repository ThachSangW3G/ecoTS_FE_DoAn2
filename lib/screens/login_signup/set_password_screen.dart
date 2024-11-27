
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/login_signup/button_green.dart';
import '../../constants/app_border.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controllers/auth_controller.dart';
import '../staff/successful_screen.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  AuthController authController = Get.put(AuthController());

  bool _isLoading = false;

  Future<void> resetPassword() async {
    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      final snackdemo = SnackBar(
        content: Text(
          'Vui lòng điền đầy đủ thông tin!',
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

    final success =
        await authController.resetPassword(newPassword, confirmPassword);

    if (success) {
      Get.to(() => const SuccessfulScreen());
    } else {
      final snackdemo = SnackBar(
        content: Text(
          'Đổi mật khẩu không thành công!',
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

  bool _isObscured = true;
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
                      Text('Set a password', style: kLableTextBlackBig),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Your previous password has been reseted. Please set a new password for your account.',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: newPasswordController,
                        style: kLableTextBlackMinium,
                        obscureText: _isObscured,
                        decoration: InputDecoration(
                            contentPadding: borderRadiusTextField,
                            suffixIcon: IconButton(
                              icon: _isObscured
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscured = !_isObscured;
                                });
                              },
                            ),
                            labelText: 'Create password',
                            labelStyle: kLableTextBlackMinium,
                            focusedBorder: borderTextFieldFocus,
                            border: borderTextField),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: confirmPasswordController,
                        style: kLableTextBlackMinium,
                        obscureText: _isObscured,
                        decoration: InputDecoration(
                            contentPadding: borderRadiusTextField,
                            suffixIcon: IconButton(
                              icon: _isObscured
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscured = !_isObscured;
                                });
                              },
                            ),
                            labelText: 'Re-enter password',
                            labelStyle: kLableTextBlackMinium,
                            focusedBorder: borderTextFieldFocus,
                            border: borderTextField),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: resetPassword,
                        child: ButtonGreen(
                          isLoading: _isLoading,
                          title: 'Set new password',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ]))));
  }
}
