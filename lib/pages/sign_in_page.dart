import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in_system_by_satyam/design_elements.dart';
import 'package:google_sign_in_system_by_satyam/pages/home_page.dart';
import 'package:google_sign_in_system_by_satyam/pages/sign_in_provider.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  //final contoller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    var icon = "assets/icons/show.png";
    final controller = Get.put(LoginController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Obx(() {
            if (controller.googleAccount.value == null)
              return LogInPageWidget(screenWidth: screenWidth, icon: icon);
            else
              return LoggedInHomePage();
          })),
    );
  }
}

class LogInPageWidget extends StatelessWidget {
  LogInPageWidget({
    super.key,
    required this.screenWidth,
    required this.icon,
  });

  final double screenWidth;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final contoller = Get.put(LoginController());
    return SafeArea(
      child: ListView(children: [
        Image.asset(
          "assets/images/signup_illustation.png",
          fit: BoxFit.contain,
          width: screenWidth - 40,
        ),
        Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              "Welcome back!",
              style: headingStyle,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "You've been missed",
              style: subHeadingStyle,
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton.icon(
          icon: Image.asset(
            "assets/icons/google.png",
            fit: BoxFit.contain,
            height: 30,
          ),
          onPressed: () {
            contoller.login();
            /* final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();*/
          },
          label: Text(
            "Sign in with Google",
            style: buttonText,
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade200,
              foregroundColor: Color.fromARGB(255, 0, 0, 0),
              elevation: 0,
              minimumSize: Size(screenWidth - 30, 45)),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: (screenWidth / 2) - 40,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.grey.shade200)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text(
                "Or",
                style: subHeadingStyle,
              ),
            ),
            Container(
              width: (screenWidth / 2) - 40,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.grey.shade200)),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 10, right: 10),
            width: screenWidth - 30,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: Colors.grey.shade200)),
            child: TextField(
              decoration: InputDecoration.collapsed(
                  hintText: "Enter your Email", hintStyle: subHeadingStyle),
            )),
        SizedBox(
          height: 20,
        ),
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 10, right: 10),
            width: screenWidth - 30,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: Colors.grey.shade200)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration.collapsed(
                        hintText: "Enter your Password",
                        hintStyle: subHeadingStyle.copyWith(
                            fontWeight: FontWeight.w300)),
                  ),
                ),
                InkWell(
                  child: Image.asset(
                    icon,
                    color: Colors.grey,
                  ),
                )
              ],
            )),
        SizedBox(
          height: 40,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            "Sign in",
            style: buttonText,
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              elevation: 0,
              foregroundColor: Colors.white,
              minimumSize: Size(screenWidth - 30, 45)),
        ),
        SizedBox(
          height: 20,
        ),
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(style: subHeadingStyle, children: [
              TextSpan(text: "Don't have an account? "),
              TextSpan(
                  text: "Sign up here",
                  style: subHeadingStyle.copyWith(
                      color: Color.fromARGB(255, 44, 7, 255)))
            ]))
      ]),
    );
  }
}
