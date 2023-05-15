// ignore_for_file: deprecated_member_use, file_names, must_be_immutable
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sav/controller/AuthController.dart';

import '../constants.dart';
import '../controller/NavigationController.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationController navigationController = Get.find();
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: const [
                Icon(
                  Icons.domain_sharp,
                  size: 40,
                ),
                Center(
                    child: SizedBox(
                  child: Text("Service Après Vente"),
                )),
              ],
            ),
          ),
          DrawerListTile(
            title: "Accueil",
            icon: Icons.dashboard,
            index: 0,
            press: () {
              navigationController.currentIndex = 0;
            },
          ),
          DrawerListTile(
            title: "Réclamations",
            index: 1,
            icon: Icons.receipt_long_outlined,
            press: () {
              navigationController.currentIndex = 1;
            },
          ),
          DrawerListTile(
            title: "Techniciens",
            icon: Icons.people,
            index: 2,
            press: () {
              navigationController.currentIndex = 2;
            },
          ),
          DrawerListTile(
            title: "Statistiques",
            icon: Icons.bar_chart,
            index: 3,
            press: () {
              navigationController.currentIndex = 3;
            },
          ),
          DrawerListTile(
            title: "Paramètres",
            icon: Icons.settings,
            index: 4,
            press: () {
              navigationController.currentIndex = 4;
            },
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.index,
    required this.icon,
    required this.press,
  }) : super(key: key);
  final int index;
  final String title;
  final IconData icon;
  final VoidCallback press;
  NavigationController navigationController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => navigationController.currentIndex == index
        ? ListTile(
            onTap: press,
            horizontalTitleGap: 0.0,
            leading: Icon(icon, color: greenClr),
            title: Text(
              title,
              style: const TextStyle(
                  color: greenClr, fontSize: 14, fontWeight: FontWeight.w700),
            ),
          )
        : ListTile(
            onTap: press,
            horizontalTitleGap: 0.0,
            leading: Icon(icon),
            title: Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ));
  }
}
