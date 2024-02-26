// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositEntity _$DepositEntityFromJson(Map<String, dynamic> json) =>
    DepositEntity(
      id: json['id'] as String,
      clientId: json['client_id'] as String,
      type: json['type'] as String,
      agreementNumber: json['agreement_number'] as String,
      begin: json['begin'] as int,
      end: json['end'] as int,
      agreementBegin: json['agreement_begin'] as int,
      agreementEnd: json['agreement_end'] as int,
      amount: BigInt.parse(json['amount'] as String),
      interest: json['interest'] as int,
      accounts: (json['accounts'] as List<dynamic>)
          .map((e) => AccountEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DepositEntityToJson(DepositEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client_id': instance.clientId,
      'type': instance.type,
      'agreement_number': instance.agreementNumber,
      'begin': instance.begin,
      'end': instance.end,
      'agreement_begin': instance.agreementBegin,
      'agreement_end': instance.agreementEnd,
      'amount': instance.amount.toString(),
      'interest': instance.interest,
      'accounts': instance.accounts.map((e) => e.toJson()).toList(),
    };
