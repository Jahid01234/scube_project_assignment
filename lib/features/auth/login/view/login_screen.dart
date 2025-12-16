import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_assignment/core/const/app_colors.dart';
import 'package:scube_assignment/core/const/images_path.dart';
import 'package:scube_assignment/core/global_widgets/app_primary_button.dart';
import 'package:scube_assignment/core/global_widgets/custom_text_field.dart';
import 'package:scube_assignment/core/routes/routes.dart';
import 'package:scube_assignment/core/style/global_text_style.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: AppColors.appPrimaryColor,
          ),
          Positioned(
            top: size.height * 0.12,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(ImagePath.appLogo, height: 98, width: 96),
                SizedBox(height: size.height * 0.02),
                Text(
                  "SCUBE",
                  style: globalTextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: size.height * 0.005),
                Text(
                  "Control & Monitoring System",
                  style: globalTextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.55,
              width: size.width,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Login",
                      style: globalTextStyle(
                        color: AppColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),

                    CustomTextField(
                      controller: controller.usernameController,
                      hinText: "Username",
                    ),
                    SizedBox(height: size.height * 0.02),
                    Obx(
                      () => CustomTextField(
                        obsecureText: controller.isPasswordHidden.value,
                        controller: controller.passwordController,
                        hinText: "Password",
                        suffixIcon: IconButton(
                          onPressed: controller.togglePassword,
                          icon: Icon(
                            controller.isPasswordHidden.value
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.gray,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.01),
                    GestureDetector(
                      onTap: () {
                        controller.onForgotPasswordTap();
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot password?",
                          style: globalTextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ).copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.05),
                    AppPrimaryButton(
                      text: "Login",
                      textColor: AppColors.white,
                      onTap: () {
                        Get.toNamed(AppRoutes.dashboard);
                      },
                    ),
                    SizedBox(height: size.height * 0.01),

                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Don’t have any account? ",
                          style: globalTextStyle(
                            fontSize: 12,
                            color: AppColors.gray,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: "Register Now",
                              style: globalTextStyle(
                                fontSize: 14,
                                color: AppColors.appPrimaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  controller.onRegisterNowTap();
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
