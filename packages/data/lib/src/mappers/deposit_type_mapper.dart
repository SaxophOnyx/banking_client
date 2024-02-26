import 'package:domain/domain.dart';

// TODO(SaxophOnyx): Implement mapper
abstract class DepositTypeMapper {
  static DepositType fromEntity(String entity) {
    return DepositType.typeA;
  }

  static String toEntity(DepositType type) {
    return DepositType.typeA.name;
  }
}
