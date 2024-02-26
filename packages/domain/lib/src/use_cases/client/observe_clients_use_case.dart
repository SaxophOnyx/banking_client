import 'package:core/core.dart';

import '../../../domain.dart';

class ObserveClientsUseCase extends StreamUseCase<NoParams, ItemNotification<Client>> {
  final ClientRepository _clientRepository;

  const ObserveClientsUseCase({
    required ClientRepository clientRepository,
  }) : _clientRepository = clientRepository;

  @override
  Stream<ItemNotification<Client>> execute([NoParams? payload]) {
    return _clientRepository.clientStream;
  }
}
