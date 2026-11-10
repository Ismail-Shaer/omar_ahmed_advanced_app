

import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';
@JsonSerializable()
class LoginResponseModel {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  bool? status;
  int? code;

  LoginResponseModel({this.message, this.userData, this.status, this.code});

 factory LoginResponseModel.fromJson(Map<String, dynamic> json)=>_$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$LoginResponseModelToJson(this);
}

@JsonSerializable()
class UserData {
  List<String>? name;
  List<String>? email;
  List<String>? phone;
  List<String>? gender;
  List<String>? password;

  UserData({this.name, this.email, this.phone, this.gender, this.password});

 factory UserData.fromJson(Map<String, dynamic> json)=>_$UserDataFromJson(json);

  Map<String, dynamic> toJson()=>_$UserDataToJson(this);
  }
