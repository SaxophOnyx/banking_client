import 'package:banking_client/domain/domain.dart';

class CreateClientUseCase extends FutureUseCase<ClientDTO, Client> {
  final ClientRepository _clientRepository;

  const CreateClientUseCase({
    required ClientRepository clientRepository,
  }) : _clientRepository = clientRepository;

  @override
  Future<Client> execute(ClientDTO payload) async {
    return _clientRepository.createClient(payload);
  }
}
