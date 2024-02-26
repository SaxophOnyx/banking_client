import '../../../data.dart';

abstract class DepositProvider {
  Future<List<String>> getDepositIDsByClientId(String id);

  Future<DepositEntity> getDeposit({
    required String clientId,
    required String depositId,
  });

  Future<DepositEntity> addDeposit({
    required String clientId,
    required DepositDTOEntity dto,
  });
}
