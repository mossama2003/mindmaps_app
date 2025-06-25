import '../../../features/shared/auth/data/enums/auth_user_enum.dart';

class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? type;
  AuthUserEnum? typeEnum;
  bool? accountReady;
  String? dateOfBirth;
  String? nationality;
  String? gender;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.type,
    this.typeEnum,
    this.accountReady,
    this.dateOfBirth,
    this.nationality,
    this.gender,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    type = json['type'];
    typeEnum = AuthUserEnumExtension.fromString(json['type']);
    accountReady = json['account_ready'];
    dateOfBirth = json['date_of_birth'];
    nationality = json['nationality'];
    gender = json['gender'];
  }
}
