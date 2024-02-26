import '../../domain.dart';

abstract class ClientRepository {
  Stream<ItemNotification<Client>> get clientStream;

  Future<List<Client>> queryClients();

  Future<Client> createClient(ClientDTO payload);

  Future<Client> updateClient({
    required String id,
    required ClientDTO data,
  });
}
