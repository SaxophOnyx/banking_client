import 'package:banking_client/domain/domain.dart';

abstract class ClientRepository {
  Future<List<Client>> queryClients();

  Future<Client> createClient(ClientDTO payload);

  Future<Client> updateClient({
    required int id,
    required ClientDTO data,
  });
}
