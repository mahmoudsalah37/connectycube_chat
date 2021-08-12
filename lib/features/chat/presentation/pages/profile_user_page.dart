import 'dart:io';

import 'package:connectycube_chat/core/src/colors.dart';
import 'package:connectycube_chat/core/src/widgets/custom_button.dart';
import 'package:connectycube_chat/core/utils/resposive.dart';
import 'package:connectycube_chat/features/auth/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUserPage extends StatefulWidget {
  @override
  _ProfileUserPageState createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
  final TextEditingController userNameTEC = TextEditingController(text: ''),
      lastNameTEC = TextEditingController(text: ''),
      firstNameTEC = TextEditingController(text: ''),
      NameTEC = TextEditingController(text: ''),
      phoneTEC = TextEditingController(text: ''),
      passwordTEC = TextEditingController(text: '');

  File? file;

  Future<void> pickImg() async {
    final pickedImg = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedImg != null) {
      print('picked');
      setState(() {
        file = File(pickedImg.path);
      });
      print('pickedImgPath = ${file!.path}');
    } else {
      print('Canceled');
    }
  }

  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: res.getHeight(10), left: 10, right: 10),
        children: [
          SizedBox(height: res.getHeight(2)),
          Center(
            child: GestureDetector(
              onTap: pickImg,
              child: Stack(
                children: [
                  Hero(
                    tag: 'profile_hero',
                    child: Container(
                      width: res.getWidth(40),
                      height: res.getHeight(20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: file != null
                            ? DecorationImage(
                                image: FileImage(file!), fit: BoxFit.cover)
                            : DecorationImage(
                                image: AssetImage('assets/test/person.jpeg'),
                                fit: BoxFit.cover),
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
            controller: firstNameTEC,
            hint: 'First Name',
            inputType: TextInputType.text,
            prefixIcon: Icons.person_outline,
          ),
          SizedBox(height: res.getHeight(4)),
          TextFieldWidget(
            controller: lastNameTEC,
            hint: 'Last Name',
            inputType: TextInputType.text,
            prefixIcon: Icons.person_outline,
          ),
          SizedBox(height: res.getHeight(4)),
          TextFieldWidget(
            controller: userNameTEC,
            hint: 'User Name',
            inputType: TextInputType.text,
            prefixIcon: Icons.person_outline,
          ),
          SizedBox(height: res.getHeight(4)),
          TextFieldWidget(
            controller: firstNameTEC,
            hint: 'password',
            inputType: TextInputType.text,
            prefixIcon: Icons.lock_outline,
          ),
          SizedBox(height: res.getHeight(4)),
          TextFieldWidget(
            controller: phoneTEC,
            hint: 'phone',
            inputType: TextInputType.text,
            prefixIcon: Icons.phone,
          ),
          SizedBox(height: res.getHeight(4)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: res.getWidth(20)),
            child: CustomButton(
              title: 'Done',
              onPressed: () {},
              paddingHorizontal: 70,
            ),
          ),
        ],
      ),
    );
  }
}
