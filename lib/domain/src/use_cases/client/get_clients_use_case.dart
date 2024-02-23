import 'package:banking_client/core/core.dart';
import 'package:banking_client/domain/domain.dart';

class GetClientsUseCase extends FutureUseCase<NoParams, List<Client>> {
  final ClientRepository _clientRepository;

  const GetClientsUseCase({
    required ClientRepository clientRepository,
  }) : _clientRepository = clientRepository;

  @override
  Future<List<Client>> execute([NoParams? payload]) async {
    return _clientRepository.queryClients();
  }
}
