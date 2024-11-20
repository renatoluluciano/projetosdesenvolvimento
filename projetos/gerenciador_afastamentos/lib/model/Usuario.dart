// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Usuario {
  final int? idUser;
  final String userNameCompleto;
  final String username;
  final String? userDataNascimento;
  final bool userType;

  Usuario({
    this.idUser,
    required this.userNameCompleto,
    required this.username,
    this.userDataNascimento,
    required this.userType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idUser': idUser,
      'userNameCompleto': userNameCompleto,
      'username': username,
      'userDataNascimento': userDataNascimento,
      'userType': userType,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      idUser: map['idUser'] != null ? map['idUser'] as int : null,
      userNameCompleto: map['userNameCompleto'] as String,
      username: map['username'] as String,
      userDataNascimento: map['userDataNascimento'] != null
          ? map['userDataNascimento'] as String
          : null,
      userType: map['userType'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) =>
      Usuario.fromMap(json.decode(source) as Map<String, dynamic>);
}
