import 'package:domain/domain.dart';

import '../../data.dart';

abstract class ClientMapper {
  static Client fromEntity(ClientEntity entity) {
    return Client(
      id: entity.id,
      firstName: entity.firstName,
      middleName: entity.middleName,
      lastName: entity.lastName,
      gender: GenderMapper.fromEntity(entity.gender),
      birthAddress: entity.birthAddress,
      currentCity: entity.currentCity,
      currentAddress: entity.currentAddress,
      cityOfResidence: entity.cityOfResidence,
      residenceAddress: entity.residenceAddress,
      citizenship: entity.citizenship,
      passportSeries: entity.passportSeries,
      passportNumber: entity.passportNumber,
      idNumber: entity.idNumber,
      issuing: entity.issuing,
      issuingDate: DateTimeMapper.fromEntity(entity.issuingDate),
      monthlyIncome: entity.monthlyIncome,
      retiree: entity.retiree,
      familyStatus: FamilyStatusMapper.fromEntity(entity.familyStatus),
      disability: DisabilityMapper.fromEntity(entity.disability),
      conscription: entity.conscription,
    );
  }
}
