import 'package:banking_client/core/core.dart';
import 'package:banking_client/domain/domain.dart';

typedef NullOrFamilyStatus = NullOr<FamilyStatus>;
typedef NullOrDisability = NullOr<Disability>;

class MiscSubState {
  final FamilyStatus? familyStatus;
  final Disability disability;
  final bool conscription;

  final String familyStatusError;

  const MiscSubState({
    required this.familyStatus,
    required this.disability,
    required this.conscription,
    required this.familyStatusError,
  });

  const MiscSubState.empty()
      : familyStatus = null,
        familyStatusError = '',
        disability = Disability.none,
        conscription = false;

  MiscSubState.fromUser(User user)
      : familyStatus = user.familyStatus,
        familyStatusError = '',
        disability = user.disability,
        conscription = user.conscription;

  MiscSubState copyWith({
    FamilyStatus? familyStatus,
    final Disability? disability,
    final bool? conscription,
    String? familyStatusError,
  }) {
    return MiscSubState(
      familyStatus: familyStatus ?? this.familyStatus,
      familyStatusError: familyStatusError ?? this.familyStatusError,
      disability: disability ?? this.disability,
      conscription: conscription ?? this.conscription,
    );
  }
}
