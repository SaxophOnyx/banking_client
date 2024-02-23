import 'package:banking_client/domain/domain.dart';

typedef UpdateClientPayload = ({int id, ClientDTO data});

class UpdateClientUseCase extends FutureUseCase<UpdateClientPayload, void> {
  final ClientRepository _clientRepository;

  const UpdateClientUseCase({
    required ClientRepository clientRepository,
  }) : _clientRepository = clientRepository;

  @override
  Future<Client> execute(UpdateClientPayload payload) {
    return _clientRepository.updateClient(
      id: payload.id,
      data: payload.data,
    );
  }
}
