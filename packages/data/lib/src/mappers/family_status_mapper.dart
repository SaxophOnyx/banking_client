import 'package:domain/domain.dart';

abstract class FamilyStatusMapper {
  static FamilyStatus fromEntity(String entity) {
    switch (entity) {
      case 'Single':
        return FamilyStatus.single;

      case 'Married':
        return FamilyStatus.married;

      default:
        throw UnimplementedError();
    }
  }

  static String toEntity(FamilyStatus status) {
    switch (status) {
      case FamilyStatus.single:
        return 'Single';

      case FamilyStatus.married:
        return 'Married';
    }
  }
}
