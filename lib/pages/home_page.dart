import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in_system_by_satyam/design_elements.dart';

import 'sign_in_provider.dart';

class LoggedInHomePage extends StatelessWidget {
  const LoggedInHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final contoller = Get.put(LoginController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage:
                  Image.network(contoller.googleAccount.value?.photoUrl ?? '')
                      .image,
              radius: 100,
            ),
            Text(
              contoller.googleAccount.value?.displayName ?? '',
              style: headingStyle,
            ),
            Text(
              contoller.googleAccount.value?.email ?? '',
              style: subHeadingStyle,
            ),
            SizedBox(
              height: 20,
            ),
            ActionChip(
              padding: EdgeInsets.all(2),
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
              label: Text(
                "Log out",
                style: buttonText.copyWith(color: Colors.white),
              ),
              avatar: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                contoller.logout();
              },
            )
          ],
        ),
      ),
    );
  }
}
