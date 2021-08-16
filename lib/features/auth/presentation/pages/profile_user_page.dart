import 'package:connectycube_chat/core/src/colors.dart';
import 'package:connectycube_chat/core/src/widgets/custom_button.dart';
import 'package:connectycube_chat/core/utils/resposive.dart';
import 'package:connectycube_chat/features/auth/presentation/getx/profile_controller.dart';
import 'package:connectycube_chat/features/auth/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProfileUserPage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    final avatar = controller.userCachedData?.avatar;
    final res = Responsive(context);
    final textTheme = Theme.of(context).textTheme;
    return ModalProgressHUD(
      inAsyncCall: controller.getLoadingIndicator,
      progressIndicator: CircularProgressIndicator(),
      child: Scaffold(
        body: Form(
          key: controller.formKey,
          child: ListView(
            padding:
                EdgeInsets.only(top: res.getHeight(10), left: 10, right: 10),
            children: [
              SizedBox(height: res.getHeight(2)),
              Center(
                child: GestureDetector(
                  onTap: controller.pickImg,
                  child: Stack(
                    children: [
                      Hero(
                        tag: 'profile_hero',
                        child: Container(
                          width: res.getWidth(40),
                          height: res.getHeight(20),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[400],
                            child: controller.pickedImgFile != null
                                ? ClipOval(
                                    child: Image.file(controller.pickedImgFile!))
                                : avatar!.isNotEmpty
                                    ? ClipOval(child: Image.network(avatar))
                                    : Text(
                                        controller
                                            .getFirstChar(
                                                string:
                                                    controller.fullNameTEC.text,
                                                limitTo: 1)
                                            .toUpperCase(),
                                        style: textTheme.headline1
                                            ?.copyWith(fontSize: 40),
                                      ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 10,
                        // alignment: Alignment.centerRight,
                        child: CircleAvatar(
                          backgroundColor: CustomColors.primaryColor,
                          radius: 20,
                          child: Icon(Icons.edit),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: res.getHeight(4)),
              TextFieldWidget(
                controller: controller.fullNameTEC,
                hint: 'Full Name',
                inputType: TextInputType.text,
                prefixIcon: Icons.person_outline,
                validator: (v) {
                  final value = v ?? '';
                  if (value.isEmpty) {
                    return 'Invalid';
                  }
                },
              ),
              SizedBox(height: res.getHeight(4)),
              TextFieldWidget(
                controller: controller.userNameTEC,
                hint: 'User Name',
                inputType: TextInputType.text,
                prefixIcon: Icons.person_outline,
                validator: (v) {
                  final value = v ?? '';
                  if (value.isEmpty) {
                    return 'Invalid';
                  }
                },
              ),
              SizedBox(height: res.getHeight(4)),
              TextFieldWidget(
                controller: controller.passwordTEC,
                hint: 'Password',
                inputType: TextInputType.text,
                prefixIcon: Icons.lock_outline,
                validator: (v) {
                  // if (v!.isEmpty) {
                  //   return 'Invalid';
                  // }
                },
              ),
              SizedBox(height: res.getHeight(4)),
              TextFieldWidget(
                controller: controller.newPasswordTEC,
                hint: 'Password Confirmation',
                inputType: TextInputType.text,
                prefixIcon: Icons.lock_outline,
                validator: (v) {
                  final value = v ?? '';
                  // if (value.isEmpty) {
                  //   return 'Invalid';
                  // }
                  // else if (controller.passwordTEC.text!=controller.passwordConfirmationTEC.text){
                  //   return 'Not matched with password';
                  // }
                },
              ),
              SizedBox(height: res.getHeight(4)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: res.getWidth(20)),
                child: CustomButton(
                  title: 'Done',
                  onPressed: controller.updateUserData,
                  paddingHorizontal: 70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
