
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../components/login_signup/button_green.dart';
import '../../constants/app_border.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controllers/auth_controller.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isObscured = true;
  bool _isChecked = false;

  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController dayOfBirthController = TextEditingController();
  DateTime dayOfBirth = DateTime.now();

  AuthController authController = Get.put(AuthController());

  bool _isLoading = false;

  String formatDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  Future<void> signup() async {
    final fullname = fullnameController.text;
    final email = emailController.text;
    final username = usernameController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    print(dayOfBirth.toIso8601String());

    if (fullname.isEmpty ||
        email.isEmpty ||
        username.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        !_isChecked) {
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

    if (password != confirmPassword) {
      final snackdemo = SnackBar(
        content: Text(
          'Xác nhận mật khẩu không chính xác!',
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

    final success = await authController.signup(
        email, username, fullname, password, dayOfBirth.toIso8601String());

    if (success) {
      Get.to(() => const LoginScreen());
    } else {
      final snackdemo = SnackBar(
        content: Text(
          'Đăng ký không thành công!',
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
              Text('Sign up', style: kLableTextBlackBig),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Let’s get you all st up so you can access your personal account.',
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: kLableTextBlackMinium,
                controller: fullnameController,
                decoration: InputDecoration(
                    contentPadding: borderRadiusTextField,
                    labelText: 'Full name',
                    labelStyle: kLableTextBlackMinium,
                    focusedBorder: borderTextFieldFocus,
                    border: borderTextField),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                style: kLableTextBlackMinium,
                controller: emailController,
                decoration: InputDecoration(
                    contentPadding: borderRadiusTextField,
                    labelText: 'Email',
                    labelStyle: kLableTextBlackMinium,
                    focusedBorder: borderTextFieldFocus,
                    border: borderTextField),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                style: kLableTextBlackMinium,
                controller: usernameController,
                decoration: InputDecoration(
                    contentPadding: borderRadiusTextField,
                    labelText: 'Username',
                    labelStyle: kLableTextBlackMinium,
                    focusedBorder: borderTextFieldFocus,
                    border: borderTextField),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                style: kLableTextBlackMinium,
                controller: dayOfBirthController,
                readOnly: true,
                decoration: InputDecoration(
                    suffixIcon: InkWell(
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime(2026))
                              .then((value) {
                            setState(() {
                              dayOfBirth = value!;
                              dayOfBirthController.text =
                                  formatDate(dayOfBirth);
                            });
                          });
                        },
                        child: const Icon(Icons.calendar_month)),
                    contentPadding: borderRadiusTextField,
                    labelText: 'Day of birth',
                    labelStyle: kLableTextBlackMinium,
                    focusedBorder: borderTextFieldFocus,
                    border: borderTextField),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: passwordController,
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
                    labelText: 'Password',
                    labelStyle: kLableTextBlackMinium,
                    focusedBorder: borderTextFieldFocus,
                    border: borderTextField),
              ),
              const SizedBox(
                height: 15,
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
                    labelText: 'Confirm password',
                    labelStyle: kLableTextBlackMinium,
                    focusedBorder: borderTextFieldFocus,
                    border: borderTextField),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    },
                    activeColor: const Color.fromARGB(255, 154, 153, 153),
                  ),
                  Expanded(
                    child: RichText(
                        maxLines: 2,
                        text: TextSpan(
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: AppColors.stack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                            children: const [
                              TextSpan(text: 'I agree to all to '),
                              TextSpan(
                                  text: 'Term',
                                  style: TextStyle(color: AppColors.slamon)),
                              TextSpan(text: ' and '),
                              TextSpan(
                                  text: 'Privacy Policies',
                                  style: TextStyle(color: AppColors.slamon)),
                            ])),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: signup,
                child: ButtonGreen(
                  isLoading: _isLoading,
                  title: 'Sign up',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () => {Get.off(() => const LoginScreen())},
                    child: Text(
                      'Login',
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: AppColors.slamon,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
