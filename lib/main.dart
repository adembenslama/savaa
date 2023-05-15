import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sav/view/LoadingScreen.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'constants.dart';
import 'controller/ControllerBinding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: "https://nwoqxpfcecqzenpfalfx.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im53b3F4cGZjZWNxemVucGZhbGZ4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODMwMDcxMTMsImV4cCI6MTk5ODU4MzExM30.HEKLhL-6zvO_gBhLZlbEhDWkywI-D83g49TXMOGepi0");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      title: 'Service Après Vente',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: generateMaterialColor(greenClr),
          brightness: Brightness.dark,
          primaryColor: greenClr,
          useMaterial3: true,
          scaffoldBackgroundColor: background),
      home: const LoadingSreen(),
    );
  }
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);
