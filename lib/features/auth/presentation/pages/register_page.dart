import '../../../../core/src/widgets/loading_indicator_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/utils/validator.dart';

import '../../../../core/src/colors.dart';
import '../getx/register_controller.dart';

import '../../../../core/src/routes.dart';
import '../../../../core/src/widgets/custom_button.dart';
import '../../../../core/utils/resposive.dart';
import '../widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    ThemeData theme = Theme.of(context);

    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.getLoadingIndicator,
        progressIndicator: LoadingIndicatorWidget(),
        child: Scaffold(
          body: Form(
            key: controller.formKey,
            child: ListView(
              padding:
                  EdgeInsets.only(top: res.getHeight(10), left: 10, right: 10),
              children: [
                SizedBox(height: res.getHeight(2)),
                Center(
                  child: Image.asset(
                    'assets/images/toast_icon.png',
                    height: res.getHeight(16),
                  ),
                ),
                SizedBox(height: res.getHeight(4)),
                TextFieldWidget(
                  controller: controller.fullNameTEC,
                  hint: 'Full Name',
                  inputType: TextInputType.text,
                  prefixIcon: Icons.person_outline,
                  validator: CustomValidator.fullNameValidation,
                ),
                SizedBox(height: res.getHeight(4)),
                TextFieldWidget(
                  controller: controller.userNameTEC,
                  hint: 'User Name',
                  inputType: TextInputType.text,
                  prefixIcon: Icons.person_outline,
                  validator: CustomValidator.userNameValidation,
                ),
                SizedBox(height: res.getHeight(4)),
                TextFieldWidget(
                  controller: controller.passwordTEC,
                  hint: 'Password',
                  inputType: TextInputType.text,
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  validator: CustomValidator.passwordValidator,
                ),
                SizedBox(height: res.getHeight(4)),
                TextFieldWidget(
                  controller: controller.rePasswordTEC,
                  hint: 'Re-Password',
                  inputType: TextInputType.text,
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  validator: (v) {
                    if (v?.trim() != controller.rePasswordTEC.text.trim())
                      return 'Not Match';
                  },
                ),
                SizedBox(height: res.getHeight(4)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: res.getWidth(20)),
                  child: CustomButton(
                    title: 'Sign Up',
                    onPressed: controller.registerUser,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.offNamed(Routes.loginPage);
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'if you already have account?',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: '\nSignIn!',
                          style: theme.textTheme.headline2!.copyWith(
                              color: CustomColors.yellowDeepColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
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
    );
  }
}
