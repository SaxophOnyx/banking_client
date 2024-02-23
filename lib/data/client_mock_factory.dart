import 'package:banking_client/domain/domain.dart';

abstract class ClientMockGenerator {
  static Client get() {
    return Client(
      id: 12345,
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
