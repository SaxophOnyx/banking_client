import 'package:domain/domain.dart';

abstract class GenderMapper {
  static Gender fromEntity(String entity) {
    switch (entity) {
      case 'Male':
        return Gender.male;
      case 'Female':
        return Gender.female;
      case 'Other':
        return Gender.other;
      default:
        throw UnimplementedError();
    }
  }

  static String toEntity(Gender gender) {
    switch (gender) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.other:
        return 'Other';
    }
  }
}
