import 'dart:async';

import 'package:domain/domain.dart';

import '../../data.dart';

class ClientRepositoryImpl implements ClientRepository {
  final ClientProvider _clientProvider;
  final StreamController<ItemNotification<Client>> _clientStreamController =
      StreamController<ItemNotification<Client>>.broadcast();

  @override
  Stream<ItemNotification<Client>> get clientStream => _clientStreamController.stream;

  ClientRepositoryImpl({
    required ClientProvider clientProvider,
  }) : _clientProvider = clientProvider;

  @override
  Future<Client> createClient(ClientDTO payload) async {
    final ClientDTOEntity dto = ClientDTOMapper.toEntity(payload);
    final ClientEntity entity = await _clientProvider.createClient(dto);
    final Client client = ClientMapper.fromEntity(entity);

    _clientStreamController.add(ItemNotification<Client>.created(client));

    return client;
  }

  @override
  Future<List<Client>> queryClients() async {
    return <Client>[
      MockGenerator.getClient(id: '1'),
      MockGenerator.getClient(id: '2'),
      MockGenerator.getClient(id: '3'),
      MockGenerator.getClient(id: '4'),
    ];

    final List<Client> clients = List<Client>.empty(growable: true);

    final List<String> ids = await _clientProvider.queryClientIDs();

    for (final String id in ids) {
      final ClientEntity entity = await _clientProvider.queryClientById(id);
      final Client client = ClientMapper.fromEntity(entity);
      clients.add(client);
    }

    return clients;
  }

  @override
  Future<Client> updateClient({
    required String id,
    required ClientDTO data,
  }) async {
    final ClientDTOEntity dto = ClientDTOMapper.toEntity(data);

    final ClientEntity entity = await _clientProvider.updateClient(
      id: id,
      data: dto,
    );

    final Client client = ClientMapper.fromEntity(entity);

    _clientStreamController.add(ItemNotification<Client>.updated(client));

    return client;
  }
}
