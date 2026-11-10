// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      message: json['message'] as String?,
      userData:
          json['data'] == null
              ? null
              : UserData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.userData,
      'status': instance.status,
      'code': instance.code,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  name: (json['name'] as List<dynamic>?)?.map((e) => e as String).toList(),
  email: (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
  phone: (json['phone'] as List<dynamic>?)?.map((e) => e as String).toList(),
  gender: (json['gender'] as List<dynamic>?)?.map((e) => e as String).toList(),
  password:
      (json['password'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'gender': instance.gender,
  'password': instance.password,
};
