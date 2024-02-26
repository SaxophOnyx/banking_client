import 'package:json_annotation/json_annotation.dart';

import 'account_entity.dart';

part 'deposit_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false, explicitToJson: true)
class DepositEntity {
  final String id;
  final String clientId;
  final String type;
  final String agreementNumber;
  final int begin;
  final int end;
  final int agreementBegin;
  final int agreementEnd;
  final BigInt amount;
  final int interest;
  final List<AccountEntity> accounts;

  const DepositEntity({
    required this.id,
    required this.clientId,
    required this.type,
    required this.agreementNumber,
    required this.begin,
    required this.end,
    required this.agreementBegin,
    required this.agreementEnd,
    required this.amount,
    required this.interest,
    required this.accounts,
  });

  factory DepositEntity.fromJson(Map<String, dynamic> json) => _$DepositEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DepositEntityToJson(this);
}
