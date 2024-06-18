// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  const factory Account({
    @JsonKey(name: 'name') String? firstName,
    @JsonKey(name: 'surname') String? lastName,
    String? email,
    String? phone,
    @JsonKey(name: 'plainPassword') String? password,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
