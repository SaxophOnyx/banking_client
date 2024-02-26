import '../../../data.dart';

abstract class ClientProvider {
  Future<List<String>> queryClientIDs();

  Future<ClientEntity> queryClientById(String id);

  Future<ClientEntity> createClient(ClientDTOEntity dto);

  Future<ClientEntity> updateClient({
    required String id,
    required ClientDTOEntity data,
  });
}
