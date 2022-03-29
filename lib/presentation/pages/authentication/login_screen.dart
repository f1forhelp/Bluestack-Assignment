import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/asset_constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: 1.sh,
        decoration: BoxDecoration(
          color: Colors.black,
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   stops: [0.1, 1],
          //   colors: [
          //     Colors.pink.shade600,
          //     Colors.black,
          //   ],
          // ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(KAsset.appLogo),
              const CustomTextFormField(
                hintText: "User name",
              ),
              const CustomTextFormField(
                hintText: "Password",
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(999)),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? textEditingController;
  final Function(String)? onChange;

  const CustomTextFormField(
      {Key? key, this.hintText, this.textEditingController, this.onChange})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      controller: textEditingController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black38,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
