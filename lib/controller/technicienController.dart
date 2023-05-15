import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/technicien.dart';
import '../constants.dart';
import '../model/User.dart';

class TechnicienController extends GetxController {
  List<Technicien> listeRec = [];
  var isLoading = true.obs;
  var isAdding = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTechnicien();
  }

  void getTechnicien() async {
    try {
      isLoading(true);
      await Supabase.instance.client.from('users').select().then((value) {
        value.forEach((element) {
          listeRec.add(Technicien.fromJson(element));
        });
      });
    } on PostgrestException catch (e) {
      print(e.message);
    } finally {
      isLoading(false);
    }
    listeRec.forEach((element) {
      print(element.toString());
    });
  }

  void blockTechnicien() {}
  void unblockTechnicien() {}
  Future addTechnicien(
      String nom, String prenom, String mail, String spes) async {
    if (nom.isNotEmpty &&
        spes.isNotEmpty &&
        prenom.isNotEmpty &&
        mail.isNotEmpty) {
      if (await isMailValid(mail) == false) {
        try {
          isAdding(true);
          await Supabase.instance.client.auth
              .signUp(password: "12345678", email: mail);
          await Supabase.instance.client.from('users').insert(
            {
              'nom': nom,
              'prenom': prenom,
              'email': mail,
              'specialite': spes,
            },
          );
          Get.back();
          Get.snackbar(
            "Succes",
            "Compte ajouté avec succes",
            backgroundColor: Colors.teal,
            colorText: Colors.white,
            maxWidth: 300,
            margin: const EdgeInsets.all(10),
          );
        } catch (e) {
          Get.snackbar(
            "Erreur",
            e.hashCode.toString(),
            backgroundColor: greenClr,
            colorText: Colors.white,
            maxWidth: 300,
            margin: const EdgeInsets.all(10),
          );
        } finally {
          isAdding(false);
        }
      } else {
        Get.snackbar(
          "Erreur",
          "Email existe deja",
          backgroundColor: greenClr,
          colorText: Colors.white,
          maxWidth: 300,
          margin: const EdgeInsets.all(10),
        );
      }
    } else {
      Get.snackbar(
        "Erreur",
        "Veuillez remplir tous les champs",
        backgroundColor: greenClr,
        colorText: Colors.white,
        maxWidth: 300,
        margin: const EdgeInsets.all(10),
      );
    }
    isAdding(false);
  }

  Future<bool> isMailValid(String email) async {
    bool found = false;
    print("seriching for $email");
    await Supabase.instance.client
        .from('users')
        .select()
        .eq("email", email)
        .then((value) {
      if (value.isEmpty) {
        found = false;
      } else {
        print("found ittttttttttttttttttttttttttttttttt");
        print("found ittttttttttttttttttttttttttttttttt");
        found = true;
      }
    });

    return found;
  }
}
