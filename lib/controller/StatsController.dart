// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:sav/controller/reclamationsController.dart';

class StatsController extends GetxController {
  ReclamationController recController = Get.put(ReclamationController());
  var nbrRec = 0.obs;
  var nbrRecResolues = 0.obs;
  var nbrRecRefusees = 0.obs;
  var nbrRecEnAttente = 0.obs;
}
