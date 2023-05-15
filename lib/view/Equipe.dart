// ignore_for_file: file_names

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sav/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../controller/technicienController.dart';

class Equipe extends StatelessWidget {
  const Equipe({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nomController = TextEditingController();
    TextEditingController prenomController = TextEditingController();
    TextEditingController mailController = TextEditingController();
    TextEditingController specController = TextEditingController();
    TechnicienController techController = Get.put(TechnicienController());
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const Text(
              'Equipe',
            ),
            ElevatedButton(
                onPressed: () {
                  Get.dialog(Dialog(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: 300,
                      height: 600,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nomController,
                            decoration: const InputDecoration(
                              labelText: 'Nom',
                              hintText: 'entrer le Nom',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: prenomController,
                            decoration: const InputDecoration(
                              labelText: 'prenom',
                              hintText: 'entrer le prenom',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: mailController,
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? 'entrer un email valide'
                                    : null,
                            decoration: const InputDecoration(
                              labelText: 'E-mail',
                              hintText: 'entrer le e-mail',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.mail),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: specController,
                            decoration: const InputDecoration(
                              labelText: 'specialité',
                              hintText: 'entrer la specialité',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const Text("Mot de passe par défaut : 12345678"),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                if (techController.isAdding.value == false) {
                                  techController.addTechnicien(
                                      nomController.text,
                                      prenomController.text,
                                      mailController.text,
                                      specController.text);
                                } else {
                                  Get.snackbar(
                                    "Erreur",
                                    "Veuillez patienter",
                                    backgroundColor: greenClr,
                                    colorText: Colors.white,
                                    maxWidth: 300,
                                    margin: const EdgeInsets.all(10),
                                  );
                                }
                              },
                              child: Obx(() =>
                                  techController.isAdding.value == true
                                      ? const CircularProgressIndicator()
                                      : const Text("Ajouter")))
                        ],
                      ),
                    ),
                  ));
                },
                child: Text("Ajouter un Technicien"))
          ],
        ),
      ),
    );
  }
}
