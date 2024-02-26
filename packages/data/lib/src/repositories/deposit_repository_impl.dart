import 'package:domain/domain.dart';

import '../../data.dart';

// TODO(SaxophOnyx): Implement methods
class DepositRepositoryImpl implements DepositRepository {
  final DepositProvider _depositProvider;

  const DepositRepositoryImpl({
    required DepositProvider depositProvider,
  }) : _depositProvider = depositProvider;

  @override
  Future<List<Deposit>> getDepositsByClientId({required String clientId}) async {
    return <Deposit>[
      MockGenerator.getDeposit(clientId: clientId),
      MockGenerator.getDeposit(clientId: clientId),
      MockGenerator.getDeposit(clientId: clientId),
    ];

    final List<String> ids = await _depositProvider.getDepositIDsByClientId(clientId);
    final List<Deposit> deposits = List<Deposit>.empty(growable: true);

    for (final String id in ids) {
      final DepositEntity entity = await _depositProvider.getDeposit(clientId: clientId, depositId: id);
      final Deposit deposit = DepositMapper.fromEntity(entity);
      deposits.add(deposit);
    }

    return deposits;
  }

  @override
  Future<Deposit> addDeposit({
    required String clientId,
    required DepositDTO data,
  }) async {
    return MockGenerator.getDeposit(clientId: clientId);

    final DepositDTOEntity dtoEntity = DepositDTOMapper.toEntity(data);
    final DepositEntity depositEntity = await _depositProvider.addDeposit(
      clientId: clientId,
      dto: dtoEntity,
    );

    return DepositMapper.fromEntity(depositEntity);
  }

  @override
  Future<void> closeBankDay() async {}
}
