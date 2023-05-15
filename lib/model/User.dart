// ignore_for_file: file_names

class UserClass {
  String nom;
  String prenom;
  String? uID;
  String email;
  int? phone;
  String pfpUrl;
  int id;
  String specialite;
  bool isAdmin;
  String status;
  UserClass(
      {required this.nom,
      required this.uID,
      required this.prenom,
      required this.pfpUrl,
      required this.isAdmin,
      required this.email,
      required this.specialite,
      required this.phone,
      required this.id,
      required this.status});
  factory UserClass.fromJson(Map<String, dynamic> json) {
    return UserClass(
        nom: json['nom'],
        prenom: json['prenom'],
        uID: json['uid'],
        pfpUrl: json['pfp'],
        isAdmin: json['isAdmin'],
        email: json['email'],
        specialite: json['specialite'],
        phone: json['phone'],
        id: json['id'],
        status: json['status']);
  }
  @override
  String toString() {
    return "nom: $nom, prenom: $prenom, uid: $uID, pfp: $pfpUrl, isAdmin: $isAdmin, email: $email, specialite: $specialite, phone: $phone, id: $id, status: $status";
  }
}
