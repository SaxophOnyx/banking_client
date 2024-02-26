// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_dto_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositDTOEntity _$DepositDTOEntityFromJson(Map<String, dynamic> json) =>
    DepositDTOEntity(
      clientId: json['client_id'] as String,
      type: json['type'] as String,
      agreementNumber: json['agreement_number'] as String,
      agreementBegin: json['agreement_begin'] as int,
      agreementEnd: json['agreement_end'] as int,
      amount: BigInt.parse(json['amount'] as String),
      interest: json['interest'] as int,
    );

Map<String, dynamic> _$DepositDTOEntityToJson(DepositDTOEntity instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'type': instance.type,
      'agreement_number': instance.agreementNumber,
      'agreement_begin': instance.agreementBegin,
      'agreement_end': instance.agreementEnd,
      'amount': instance.amount.toString(),
      'interest': instance.interest,
    };
