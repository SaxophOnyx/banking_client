import 'package:domain/domain.dart';

import '../../data.dart';

abstract class ClientDTOMapper {
  static ClientDTOEntity toEntity(ClientDTO dto) {
    return ClientDTOEntity(
      firstName: dto.firstName,
      middleName: dto.middleName,
      lastName: dto.lastName,
      gender: GenderMapper.toEntity(dto.gender),
      birthAddress: dto.birthAddress,
      currentCity: dto.currentCity,
      currentAddress: dto.currentAddress,
      cityOfResidence: dto.cityOfResidence,
      residenceAddress: dto.residenceAddress,
      citizenship: dto.citizenship,
      passportSeries: dto.passportSeries,
      passportNumber: dto.passportNumber,
      idNumber: dto.idNumber,
      issuing: dto.issuing,
      issuingDate: DateTimeMapper.toEntity(dto.issuingDate),
      homeNumber: dto.homeNumber,
      mobileNumber: dto.mobileNumber,
      email: dto.email,
      position: dto.position,
      placeOfWork: dto.placeOfWork,
      monthlyIncome: dto.monthlyIncome,
      retiree: dto.retiree,
      familyStatus: FamilyStatusMapper.toEntity(dto.familyStatus),
      disability: DisabilityMapper.toEntity(dto.disability),
      conscription: dto.conscription,
    );
  }
}
