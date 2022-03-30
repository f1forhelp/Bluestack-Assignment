import 'package:bluestack_assignment/presentation/pages/dashboard/home_page.dart';
import 'package:bluestack_assignment/presentation/provider/authentication/login_notifier.dart';
import 'package:bluestack_assignment/presentation/provider/base_notifier.dart';
import 'package:bluestack_assignment/presentation/widgets/base_view.dart';
import 'package:bluestack_assignment/utils/helper/ui_helper.dart';
import 'package:bluestack_assignment/utils/helper/validation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/asset_constants.dart';

class LoginPage extends StatefulWidget {
  static const String id = "LoginPage";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? name, pass;

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginNotifier>(builder: (context, model, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: 1.sh,
          decoration: BoxDecoration(
            color: Colors.black,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.5, 0.1],
              colors: [
                Colors.pink.shade600,
                Colors.black,
              ],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: UiHelper.horizontalPadding(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        KAsset.appLogo,
                        color: Colors.white,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextFormField(
                        validator: ValidationHelper.validateEmpty,
                        hintText: "User name",
                        onChange: (value) {
                          name = value;
                        },
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomTextFormField(
                        validator: ValidationHelper.validateEmpty,
                        hintText: "Password",
                        onChange: (val) {
                          pass = val;
                        },
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (formKey.currentState?.validate() ?? false) {
                            await model.login(pass: pass, userName: name);
                            if (model.viewState1 == ViewState.loaded) {
                              Navigator.pushNamed(context, HomePage.id);
                            }
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 20.w),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 132, 255),
                              borderRadius: BorderRadius.circular(999)),
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;

  const CustomTextFormField(
      {Key? key,
      this.hintText,
      this.textEditingController,
      this.onChange,
      this.validator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      onChanged: onChange,
      controller: textEditingController,
      decoration: InputDecoration(
        errorStyle: const TextStyle(color: Colors.white),
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
