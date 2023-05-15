// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:sav/controller/reclamationsController.dart';

import '../constants.dart';
import '../model/reclamation.dart';

class ReclamationScreen extends StatelessWidget {
  ReclamationScreen({super.key});
  ReclamationController reclamationController =
      Get.put(ReclamationController());
  @override
  Widget build(BuildContext context) {
    bool compareDates(DateTime date1, DateTime date2) {
      return date1.day == date2.day &&
          date1.month == date2.month &&
          date1.year == date2.year;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Obx(() {
                if (reclamationController.isLoading.value == true) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Container(
                    decoration: BoxDecoration(
                        color: bgColorLight,
                        border: Border.all(width: 1, color: Colors.white10),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Table(
                        border: const TableBorder(
                            horizontalInside:
                                BorderSide(width: 1, color: Colors.white10)),
                        children: [
                          TableRow(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Sujet',
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                            const Text("date d'ajout"),
                            const Text(
                              'Nom',
                            ),
                            const Text(
                              'Technicien',
                            ),
                            const Text(
                              'status',
                            ),
                            const Text("Action")
                          ]),
                          for (var i = 0;
                              i < reclamationController.listeRec.length;
                              i++)
                            TableRow(children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    reclamationController.listeRec[i].sujet ??
                                        "vide",
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    compareDates(
                                            DateTime.now(),
                                            reclamationController
                                                .listeRec[i].creationDate)
                                        ? DateFormat.Hm().format(
                                            reclamationController
                                                .listeRec[i].creationDate)
                                        : DateFormat.yMMMd().format(
                                            reclamationController
                                                .listeRec[i].creationDate),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(reclamationController.listeRec[i].nom ??
                                      "vide"),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(reclamationController
                                      .listeRec[i].assignedTo
                                      .toString()),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  reclamationController.listeRec[i].status ==
                                          "en attente"
                                      ? ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange,
                                            foregroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32.0),
                                            ),
                                          ),
                                          child: const Text("En Attente"),
                                        )
                                      : reclamationController
                                                  .listeRec[i].status ==
                                              "consulté"
                                          ? ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                                foregroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          32.0),
                                                ),
                                              ),
                                              child: const Text("Consulté"),
                                            )
                                          : reclamationController
                                                      .listeRec[i].status ==
                                                  "en cours"
                                              ? ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.blue,
                                                    foregroundColor:
                                                        Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32.0),
                                                    ),
                                                  ),
                                                  child: const Text("en Cours"),
                                                )
                                              : ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.red,
                                                    foregroundColor:
                                                        Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32.0),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                  child: const Text('refusé'),
                                                ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Reclamation rec =
                                                reclamationController
                                                    .listeRec[i];
                                            Get.defaultDialog(
                                              title: rec.sujet!,
                                              content: Column(
                                                children: [
                                                  Text("id : ${rec.id}"),
                                                  Text("Nom : ${rec.nom}"),
                                                  Text(
                                                      "Telephone : ${rec.numero}"),
                                                  Text(
                                                      "Produit : ${rec.produitId}"),
                                                  Text(
                                                      "Description : ${rec.description}"),
                                                  Text(
                                                      "Date : ${DateFormat.yMd().format(rec.creationDate)}"),
                                                  Text(
                                                      "Status : ${rec.status}"),
                                                ],
                                              ),
                                            );
                                          },
                                          icon:
                                              const Icon(Icons.remove_red_eye)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.assignment_returned)),
                                    ],
                                  )
                                ],
                              ),
                            ])
                        ],
                      ),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
