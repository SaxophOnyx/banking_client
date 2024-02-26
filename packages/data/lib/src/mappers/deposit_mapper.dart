import 'package:domain/domain.dart';

import '../../data.dart';

abstract class DepositMapper {
  static Deposit fromEntity(DepositEntity entity) {
    final List<Account> accounts = entity.accounts.map(AccountMapper.fromEntity).toList();

    return Deposit(
      id: entity.id,
      clientId: entity.clientId,
      type: DepositTypeMapper.fromEntity(entity.type),
      agreementNumber: entity.agreementNumber,
      begin: DateTimeMapper.fromEntity(entity.begin),
      end: DateTimeMapper.fromEntity(entity.end),
      agreementBegin: DateTimeMapper.fromEntity(entity.agreementBegin),
      agreementEnd: DateTimeMapper.fromEntity(entity.agreementEnd),
      amount: entity.amount,
      interest: entity.interest,
      accounts: accounts,
    );
  }

  static DepositEntity toEntity(Deposit deposit) {
    final List<AccountEntity> accounts = deposit.accounts.map(AccountMapper.toEntity).toList();

    return DepositEntity(
      id: deposit.id,
      clientId: deposit.clientId,
      type: DepositTypeMapper.toEntity(deposit.type),
      agreementNumber: deposit.agreementNumber,
      begin: DateTimeMapper.toEntity(deposit.begin),
      end: DateTimeMapper.toEntity(deposit.end),
      agreementBegin: DateTimeMapper.toEntity(deposit.agreementBegin),
      agreementEnd: DateTimeMapper.toEntity(deposit.agreementEnd),
      amount: deposit.amount,
      interest: deposit.interest,
      accounts: accounts,
    );
  }
}
