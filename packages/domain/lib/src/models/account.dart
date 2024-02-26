class Account {
  final String id;
  final String depositId;
  final BigInt number;
  final String activity;
  final BigInt debit;
  final BigInt credit;
  final BigInt balance;
  final String? name;

  const Account({
    required this.id,
    required this.depositId,
    required this.number,
    required this.activity,
    required this.debit,
    required this.credit,
    required this.balance,
    required this.name,
  });
}
