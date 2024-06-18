// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      firstName: json['name'] as String?,
      lastName: json['surname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      password: json['plainPassword'] as String?,
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'name': instance.firstName,
      'surname': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'plainPassword': instance.password,
    };
