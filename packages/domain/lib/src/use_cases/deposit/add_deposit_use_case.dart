import '../../../domain.dart';

typedef AddDepositPayload = ({String clientId, DepositDTO data});

class AddDepositUseCase extends FutureUseCase<AddDepositPayload, Deposit> {
  final DepositRepository _depositRepository;

  const AddDepositUseCase({
    required DepositRepository depositRepository,
  }) : _depositRepository = depositRepository;

  @override
  Future<Deposit> execute(AddDepositPayload payload) async {
    return _depositRepository.addDeposit(
      clientId: payload.clientId,
      data: payload.data,
    );
  }
}
