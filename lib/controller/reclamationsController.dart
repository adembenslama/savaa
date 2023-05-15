// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:sav/model/reclamation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReclamationController extends GetxController {
  List<Reclamation> listeRec = [];
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    if (Supabase.instance.client.auth.currentUser != null) {
      fetchData();
    }
  }

  void fetchData() async {
    try {
      isLoading(true);
      await Supabase.instance.client
          .from('reclamations')
          .select()
          .then((value) {
        value.forEach((element) {
          listeRec.add(Reclamation.fromJson(element));
        });
      });
      listeRec.forEach((element) {
        print(element.toString());
      });
    } on PostgrestException catch (e) {
      print(e.message);
    } finally {
      isLoading(false);
    }
  }
}
