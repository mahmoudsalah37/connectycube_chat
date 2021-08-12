import '../../../../core/src/routes.dart';
import '../../../../core/src/widgets/custom_button.dart';
import '../../../../core/utils/resposive.dart';
import '../widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController loginTEC = TextEditingController(text: ''),
      lastNameTEC = TextEditingController(text: ''),
      fullNameTEC = TextEditingController(text: ''),
      NameTEC = TextEditingController(text: ''),
      passwordTEC = TextEditingController(text: ''),
      rePasswordTEC = TextEditingController(text: '');

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.only(top: res.getHeight(10), left: 10, right: 10),
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
              controller: fullNameTEC,
              hint: 'Full Name',
              inputType: TextInputType.text,
              prefixIcon: Icons.person_outline,
              validator: isEmpty,
            ),
            SizedBox(height: res.getHeight(4)),
            TextFieldWidget(
              controller: loginTEC,
              hint: 'Login',
              inputType: TextInputType.text,
              prefixIcon: Icons.person_outline,
              validator: isEmpty,
            ),
            SizedBox(height: res.getHeight(4)),
            TextFieldWidget(
              controller: passwordTEC,
              hint: 'Password',
              inputType: TextInputType.text,
              prefixIcon: Icons.lock_outline,
              obscureText: true,
              validator: isEmpty,
            ),
            SizedBox(height: res.getHeight(4)),
            TextFieldWidget(
              controller: rePasswordTEC,
              hint: 'Re-Password',
              inputType: TextInputType.text,
              prefixIcon: Icons.lock_outline,
              obscureText: true,
              validator: (v) {
                if (v?.trim() != passwordTEC.text.trim()) return 'غير متطابق';
              },
            ),
            SizedBox(height: res.getHeight(4)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: res.getWidth(20)),
              child: CustomButton(
                title: 'Sign Up',
                onPressed: () {
                  final isValid = formKey.currentState?.validate() ?? false;
                  if (isValid) Get.toNamed(Routes.welcomePage);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    super.dispose();
  }
}

String? isEmpty(v) {
  final value = v ?? '';
  if (value.isEmpty) {
    return 'أدخل قيمة';
  }
}
