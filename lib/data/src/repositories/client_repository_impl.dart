import 'package:banking_client/data/data.dart';
import 'package:banking_client/domain/domain.dart';

class ClientRepositoryImpl implements ClientRepository {
  final ClientProvider _clientProvider;

  const ClientRepositoryImpl({
    required ClientProvider clientProvider,
  }) : _clientProvider = clientProvider;

  @override
  Future<Client> createClient(ClientDTO payload) async {
    return _clientProvider.createClient(payload);
  }

  @override
  Future<List<Client>> queryClients() async {
    final List<Client> users = List<Client>.empty(growable: true);

    final List<int> ids = await _clientProvider.queryClientIDs();

    for (final int id in ids) {
      final Client user = await _clientProvider.queryClientById(id);
      users.add(user);
    }

    return users;
  }

  @override
  Future<Client> updateClient({
    required int id,
    required ClientDTO data,
  }) async {
    return _clientProvider.updateClient(
      id: id,
      data: data,
    );
  }
}
