import 'package:banking_client/domain/domain.dart';

abstract class ClientProvider {
  Future<List<int>> queryClientIDs();

  Future<Client> queryClientById(int id);

  Future<Client> createClient(ClientDTO dto);

  Future<Client> updateClient({
    required int id,
    required ClientDTO data,
  });
}
