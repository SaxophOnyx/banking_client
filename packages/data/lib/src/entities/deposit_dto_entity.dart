import 'package:json_annotation/json_annotation.dart';

part 'deposit_dto_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class DepositDTOEntity {
  final String clientId;
  final String type;
  final String agreementNumber;
  final int agreementBegin;
  final int agreementEnd;
  final BigInt amount;
  final int interest;

  const DepositDTOEntity({
    required this.clientId,
    required this.type,
    required this.agreementNumber,
    required this.agreementBegin,
    required this.agreementEnd,
    required this.amount,
    required this.interest,
  });

  factory DepositDTOEntity.fromJson(Map<String, dynamic> json) => _$DepositDTOEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DepositDTOEntityToJson(this);
}
