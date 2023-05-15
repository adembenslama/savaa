class Technicien {
  final int id;
  final String? nom;
  final String? prenom;
  final String? specialit;
  final String? pfp;
  final bool isAdmin;
  final String? uid;
  final String? email;
  final int? phone;
  String? status;
  Technicien(
      {required this.pfp,
      required this.id,
      required this.uid,
      required this.email,
      required this.phone,
      required this.nom,
      required this.isAdmin,
      required this.prenom,
      required this.specialit,
      required this.status});
  void setStatus(String status) {
    if (status == 'suspendu' || status == 'active') {
      this.status = status;
    }
  }

  factory Technicien.fromJson(Map<String, dynamic> json) {
    return Technicien(
        pfp: json['pfp'],
        id: json['id'],
        uid: json['uid'],
        email: json['email'],
        phone: json['phone'],
        nom: json['nom'],
        isAdmin: json['isAdmin'],
        prenom: json['prenom'],
        specialit: json['specialite'],
        status: json['status']);
  }
  @override
  String toString() {
    return "nom: $nom, prenom: $prenom, uid: $uid, pfp: $pfp, isAdmin: $isAdmin, email: $email, specialite: $specialit, phone: $phone, id: $id, status: $status";
  }
}
