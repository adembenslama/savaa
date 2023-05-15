import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sav/mainScreen.dart';

import '../controller/AuthController.dart';

class LoadingSreen extends StatefulWidget {
  const LoadingSreen({super.key});

  @override
  State<LoadingSreen> createState() => _LoadingSreenState();
}

class _LoadingSreenState extends State<LoadingSreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthController authCont = Get.find();
    authCont.initialiseUserData();
  }

  @override
  Widget build(BuildContext context) {
    AuthController authCont = Get.find();
    return Obx(() {
      if (authCont.isLoaded == false) {
        return Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/arrowLoading.json",
                width: 200,
              ),
              const Text("Chargement...")
            ],
          )),
        );
      } else {
        return MainScreen();
      }
    });
  }
}
