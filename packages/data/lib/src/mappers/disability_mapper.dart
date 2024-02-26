import 'package:domain/domain.dart';

abstract class DisabilityMapper {
  static Disability fromEntity(String entity) {
    switch (entity) {
      case 'None':
        return Disability.none;

      case 'FirstGroup':
        return Disability.firstGroup;

      case 'SecondGroup':
        return Disability.secondGroup;

      case 'ThirdGroup':
        return Disability.thirdGroup;

      default:
        throw UnimplementedError();
    }
  }

  static String toEntity(Disability disability) {
    switch (disability) {
      case Disability.none:
        return 'None';

      case Disability.firstGroup:
        return 'FirstGroup';

      case Disability.secondGroup:
        return 'SecondGroup';

      case Disability.thirdGroup:
        return 'ThirdGroup';
    }
  }
}
