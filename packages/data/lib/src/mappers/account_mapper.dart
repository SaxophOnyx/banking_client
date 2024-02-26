import 'package:domain/domain.dart';

import '../entities/account_entity.dart';

abstract class AccountMapper {
  static Account fromEntity(AccountEntity entity) {
    return Account(
      id: entity.id,
      depositId: entity.depositId,
      number: entity.number,
      activity: entity.activity,
      debit: entity.debit,
      credit: entity.credit,
      balance: entity.balance,
      name: entity.name,
    );
  }

  static AccountEntity toEntity(Account account) {
    return AccountEntity(
      id: account.id,
      depositId: account.depositId,
      number: account.number,
      activity: account.activity,
      debit: account.debit,
      credit: account.credit,
      balance: account.balance,
      name: account.name,
    );
  }
}
