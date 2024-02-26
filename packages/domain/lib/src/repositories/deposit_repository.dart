import '../../domain.dart';

abstract class DepositRepository {
  Future<List<Deposit>> getDepositsByClientId({required String clientId});

  Future<Deposit> addDeposit({
    required String clientId,
    required DepositDTO data,
  });

  Future<void> closeBankDay();
}
