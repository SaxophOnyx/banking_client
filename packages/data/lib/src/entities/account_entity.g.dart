// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountEntity _$AccountEntityFromJson(Map<String, dynamic> json) =>
    AccountEntity(
      id: json['id'] as String,
      depositId: json['deposit_id'] as String,
      number: BigInt.parse(json['number'] as String),
      activity: json['activity'] as String,
      debit: BigInt.parse(json['debit'] as String),
      credit: BigInt.parse(json['credit'] as String),
      balance: BigInt.parse(json['balance'] as String),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AccountEntityToJson(AccountEntity instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'deposit_id': instance.depositId,
    'number': instance.number.toString(),
    'activity': instance.activity,
    'debit': instance.debit.toString(),
    'credit': instance.credit.toString(),
    'balance': instance.balance.toString(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}
