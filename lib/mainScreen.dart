// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sav/view/Apercu.dart';
import 'package:sav/view/Equipe.dart';
import 'package:sav/view/Parametres.dart';
import 'package:sav/view/Reclamation.dart';
import 'package:sav/view/SideMenu.dart';
import 'package:sav/view/Stats.dart';

import 'constants.dart';
import 'controller/AuthController.dart';
import 'controller/NavigationController.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final List<Widget> _widgetOptions = <Widget>[
    const Apercu(),
    ReclamationScreen(),
    const Equipe(),
    const Stats(),
    const Parametres(),
  ];
  NavigationController navigationController = Get.put(NavigationController());
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  const SideMenu(),
                  Column(
                    children: [
                      const Spacer(),
                      Row(
                        children: [
                          const SizedBox(width: defaultPadding),
                          const Icon(Icons.logout, color: Colors.grey),
                          TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.grey),
                              ),
                              onPressed: () {
                                _authController.logoutSupa();
                              },
                              child: const Text("se Déconnecter")),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Obx(
                    () => _widgetOptions[navigationController.currentIndex]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
