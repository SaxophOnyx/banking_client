import 'package:core/core.dart';

import '../../../domain.dart';

class CloseBankDayUseCase extends FutureUseCase<NoParams, void> {
  final DepositRepository _depositRepository;

  const CloseBankDayUseCase({
    required DepositRepository depositRepository,
  }) : _depositRepository = depositRepository;

  @override
  Future<void> execute([NoParams? payload]) async {
    await _depositRepository.closeBankDay();
  }
}
