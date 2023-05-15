// ignore_for_file: file_names

import 'package:get/get.dart';

class NavigationController extends GetxController {
  final _currentIndex = 0.obs;
  get currentIndex => _currentIndex.value;
  set currentIndex(index) => _currentIndex.value = index;
}
