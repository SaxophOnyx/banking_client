import '../../domain.dart';

class DepositDTO {
  final String clientId;
  final DepositType type;
  final String agreementNumber;
  final DateTime agreementBegin;
  final DateTime agreementEnd;
  final BigInt amount;
  final int interest;

  const DepositDTO({
    required this.clientId,
    required this.type,
    required this.agreementNumber,
    required this.agreementBegin,
    required this.agreementEnd,
    required this.amount,
    required this.interest,
  });
}
