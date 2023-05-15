// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sav/controller/StatsController.dart';

class Stats extends StatelessWidget {
  const Stats({super.key});

  @override
  Widget build(BuildContext context) {
    StatsController statsController = Get.put(StatsController());
    return Scaffold(
      body: Center(
        child: Column(
          children: const <Widget>[
            Text(
              'Stats',
            ),
          ],
        ),
      ),
    );
  }
}
