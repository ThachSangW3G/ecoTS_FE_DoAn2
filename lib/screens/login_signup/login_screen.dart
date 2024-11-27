
import 'package:ecots_fe/screens/login_signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/login_signup/button_green.dart';
import '../../components/login_signup/button_icon.dart';
import '../../constants/app_border.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controllers/achivement_controller.dart';
import '../../controllers/achivemetn_level_controller.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/donation_controller.dart';
import '../../controllers/generate_barcode_controller.dart';
import '../../controllers/location_controller.dart';
import '../../controllers/point_controller.dart';
import '../../controllers/user_controller.dart';
import '../../controllers/waste_controller.dart';
import '../bottom_nav/bottom_nav.dart';
import '../staff/home_screen_staff.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = 'login_page';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscured = true;
  bool _isChecked = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  AuthController authController = Get.put(AuthController());
  UserController userController = Get.put(UserController());
  DonationController donationController = Get.put(DonationController());
  GenerateBarcodeController generateBarcodeController =
      Get.put(GenerateBarcodeController());

  WasteController wasteController = Get.put(WasteController());

  LocationController locationController = Get.put(LocationController());
  PointController pointController = Get.put(PointController());
  AchivementController achivementController = Get.put(AchivementController());
  AchivementLevelController achivementLevelController =
      Get.put(AchivementLevelController());

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool _isLoading = false;

  Future<void> _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    setState(() {
      _isLoading = true;
    });

    final success = await authController.login(email, password);
    if (success) {
      final prefs = await _prefs;

      final role = prefs.getString('role');

      if (role != null && role == 'CUSTOMER') {
        final accessToken = prefs.getString('tokenAccess');

        await userController.getUserByToken(accessToken!);
        await generateBarcodeController.genenerateBarcode();
        await donationController.getAllDonations();
        await locationController.getAllLocations();

        await pointController.getPointByToken();
        await wasteController.getAllMaterials();
        await achivementController.fetchAchievements();
        await achivementLevelController
            .fetchAchievementResults(userController.currentUser.value!.id);

        Get.to(() => const BottomNavigation());
      } else if (role != null && role == 'EMPLOYEE') {
        final accessToken = prefs.getString('tokenAccess');
        await userController.getUserByToken(accessToken!);

        Get.to(() => const HomeScreenStaff());
      }
    } else {
      // Đăng nhập thất bại, hiển thị thông báo cho người dùn
      final snackdemo = SnackBar(
        content: Text(
          'Đăng nhập không thành công!',
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
              Text('Login', style: kLableTextBlackBig),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Login to access your ecoTS account',
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: kLableTextBlackMinium,
                controller: _emailController,
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
                obscureText: _isObscured,
                controller: _passwordController,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      Text(
                        'Remember me',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ForgotPasswordScreen());
                    },
                    child: Text(
                      'Forgot Password',
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
                height: 5,
              ),
              GestureDetector(
                onTap: _login,
                child: ButtonGreen(
                  isLoading: _isLoading,
                  title: 'Login',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Get.off(() => const SignupScreen());
                    },
                    child: Text(
                      'Sign up',
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
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
