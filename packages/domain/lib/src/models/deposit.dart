import 'account.dart';
import 'deposit_type.dart';

class Deposit {
  final String id;
  final String clientId;
  final DepositType type;
  final String agreementNumber;
  final DateTime begin;
  final DateTime end;
  final DateTime agreementBegin;
  final DateTime agreementEnd;
  final BigInt amount;
  final int interest;
  final List<Account> accounts;

  const Deposit({
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
}
