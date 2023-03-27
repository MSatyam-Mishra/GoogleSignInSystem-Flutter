import 'package:flutter/material.dart';
import 'package:google_sign_in_system_by_satyam/design_elements.dart';
import 'package:google_sign_in_system_by_satyam/pages/sign_in_page.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15, top: 15, bottom: 40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/signin_illustration.png",
                fit: BoxFit.contain,
                width: screenWidth - 40,
              ),
              Column(
                children: [
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(style: headingStyle, children: [
                        TextSpan(
                          text: "Growing your \nbusiness is ",
                        ),
                        TextSpan(
                            text: "easier",
                            style: headingStyle.copyWith(
                                color: Color.fromARGB(255, 44, 7, 255))),
                        TextSpan(
                          text: "\nthan you think!",
                        )
                      ])),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Sign up takes only 2 minutes",
                    style: subHeadingStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Get Started",
                      style: buttonText,
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        elevation: 0,
                        foregroundColor: Colors.white,
                        minimumSize: Size(screenWidth - 30, 45)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInPage())),
                    child: Text(
                      "Sign in",
                      style: buttonText,
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        foregroundColor: Colors.black,
                        elevation: 0,
                        minimumSize: Size(screenWidth - 30, 45)),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
