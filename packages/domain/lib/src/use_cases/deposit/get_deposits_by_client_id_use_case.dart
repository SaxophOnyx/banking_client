import '../../../domain.dart';

class GetDepositsByClientIdUseCase extends FutureUseCase<String, List<Deposit>> {
  final DepositRepository _depositRepository;

  const GetDepositsByClientIdUseCase({
    required DepositRepository depositRepository,
  }) : _depositRepository = depositRepository;

  @override
  Future<List<Deposit>> execute(String payload) async {
    return _depositRepository.getDepositsByClientId(clientId: payload);
  }
}
