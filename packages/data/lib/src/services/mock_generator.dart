import 'dart:math';

import 'package:domain/domain.dart';

abstract class MockGenerator {
  static final Random _random = Random();
  static const int _maxRandom = 1000;
  static int _id = 0;

  static Account getAccount({String? depositId}) {
    final String id = (++_id).toString();

    return Account(
      id: id,
      depositId: depositId ?? (++_id).toString(),
      number: BigInt.from(_random.nextInt(_maxRandom)),
      activity: 'Activity $id',
      debit: BigInt.from(_random.nextInt(_maxRandom)),
      credit: BigInt.from(_random.nextInt(_maxRandom)),
      balance: BigInt.from(_random.nextInt(_maxRandom)),
      name: 'Name $id',
    );
  }

  static Deposit getDeposit({String? clientId}) {
    final String id = (++_id).toString();
    final DateTime now = DateTime.now();

    return Deposit(
      id: id,
      clientId: clientId ?? (++_id).toString(),
      type: DepositType.typeA,
      agreementNumber: 'Agreement Number',
      begin: now.subtract(const Duration(days: 5)),
      end: now.add(const Duration(days: 5)),
      agreementBegin: now.subtract(const Duration(days: 4)),
      agreementEnd: now.add(const Duration(days: 4)),
      amount: BigInt.from(_random.nextInt(_maxRandom)),
      interest: _random.nextInt(_maxRandom),
      accounts: <Account>[
        getAccount(depositId: id),
        getAccount(depositId: id),
      ],
    );
  }

  static Client getClient({String? id}) {
    final String actualId = id ?? (++_id).toString();

    return Client(
      id: actualId,
      firstName: 'firstName',
      middleName: 'middleName',
      lastName: 'lastName',
      gender: Gender.male,
      birthAddress: 'birthAddress',
      currentCity: 'currentCity',
      currentAddress: 'currentAddress',
      cityOfResidence: 'cityOfResidence',
      residenceAddress: 'residenceAddress',
      citizenship: 'citizenship',
      idNumber: 'idNumber',
      passportSeries: 'passwordSeries',
      passportNumber: 'passwordNumber',
      issuing: 'issuing',
      position: 'position',
      issuingDate: DateTime.now(),
      monthlyIncome: 1250,
      retiree: false,
      disability: Disability.none,
      familyStatus: FamilyStatus.single,
      conscription: false,
    );
  }
}
