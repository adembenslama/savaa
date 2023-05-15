class Reclamation {
  final String? sujet;
  final String? produitId;
  final int id;
  final String? description;
  final String? nom;
  final DateTime creationDate;
  final String? numero;
  final int? assignedTo;
  final String? adresse;
  String status;
  Reclamation(
      {required this.description,
      required this.produitId,
      required this.id,
      required this.status,
      required this.assignedTo,
      required this.creationDate,
      required this.nom,
      required this.numero,
      required this.adresse,
      required this.sujet});
  factory Reclamation.fromJson(Map<String, dynamic> json) {
    return Reclamation(
        description: json['description'],
        produitId: json['produitId'],
        status: json['status'],
        id: json['idRec'],
        assignedTo: json['assignedTo'],
        nom: json['nom'],
        creationDate: DateTime.parse(json['createdat']),
        numero: json['numero'],
        adresse: json['adresse'],
        sujet: json['sujet']);
  }
  @override
  String toString() {
    return "sujet: $sujet, produitId: $produitId, description: $description, nom: $nom, numero: $numero, adresse: $adresse, status: $status";
  }

  String setStatus(String status) {
    if (status == "consulté" || status == "refusé" || status == "en Attente") {
      this.status = status;
      return "status mis à jour";
    } else {
      return "!";
    }
  }
}
