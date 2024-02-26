import 'package:domain/domain.dart';

import '../../data.dart';

abstract class DepositDTOMapper {
  static DepositDTOEntity toEntity(DepositDTO dto) {
    return DepositDTOEntity(
      clientId: dto.clientId,
      type: DepositTypeMapper.toEntity(dto.type),
      agreementNumber: dto.agreementNumber,
      agreementBegin: DateTimeMapper.toEntity(dto.agreementBegin),
      agreementEnd: DateTimeMapper.toEntity(dto.agreementEnd),
      amount: dto.amount,
      interest: dto.interest,
    );
  }
}
