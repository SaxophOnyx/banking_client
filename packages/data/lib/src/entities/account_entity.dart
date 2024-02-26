import 'package:json_annotation/json_annotation.dart';

part 'account_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AccountEntity {
  final String id;
  final String depositId;
  final BigInt number;
  final String activity;
  final BigInt debit;
  final BigInt credit;
  final BigInt balance;
  final String? name;

  const AccountEntity({
    required this.id,
    required this.depositId,
    required this.number,
    required this.activity,
    required this.debit,
    required this.credit,
    required this.balance,
    required this.name,
  });

  factory AccountEntity.fromJson(Map<String, dynamic> json) => _$AccountEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AccountEntityToJson(this);
}
