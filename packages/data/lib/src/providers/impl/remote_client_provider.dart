import 'dart:convert';

import 'package:data/data.dart';
import 'package:http/http.dart' as http;

class RemoveClientProvider implements ClientProvider {
  final String _baseUrl;

  const RemoveClientProvider({
    required String baseUrl,
  }) : _baseUrl = baseUrl;

  @override
  Future<ClientEntity> queryClientById(String id) async {
    final String rawUrl = '$_baseUrl/api/client/$id';
    final Uri url = Uri.parse(rawUrl);

    final http.Response response = await http.get(url);

    final String responseJson = response.body;
    final Map<String, dynamic> responseRaw = jsonDecode(responseJson);
    final ClientEntity updatedUser = ClientEntity.fromJson(responseRaw['client']);

    return updatedUser;
  }

  @override
  Future<List<String>> queryClientIDs() async {
    final String rawUrl = '$_baseUrl/api/client';
    final Uri url = Uri.parse(rawUrl);

    final http.Response response = await http.get(url);
    final List<dynamic> ids = jsonDecode(response.body);

    return ids.cast<String>();
  }

  @override
  Future<ClientEntity> createClient(ClientDTOEntity dto) async {
    final String rawUrl = '$_baseUrl/api/client';
    final Uri url = Uri.parse(rawUrl);

    final Map<String, dynamic> requestRaw = <String, dynamic>{'client': dto.toJson()};
    final String requestJson = jsonEncode(requestRaw);

    final http.Response response = await http.post(
      url,
      body: requestJson,
    );

    final String responseJson = response.body;
    final Map<String, dynamic> responseRaw = jsonDecode(responseJson);
    final Map<String, dynamic> clientJson = responseRaw['client'];
    final ClientEntity updatedClient = ClientEntity.fromJson(clientJson);

    return updatedClient;
  }

  @override
  Future<ClientEntity> updateClient({
    required String id,
    required ClientDTOEntity data,
  }) async {
    final String rawUrl = '$_baseUrl/api/client/$id';
    final Uri url = Uri.parse(rawUrl);

    final Map<String, dynamic> requestRaw = <String, dynamic>{'client': data.toJson()};
    final String requestJson = jsonEncode(requestRaw);

    final http.Response response = await http.put(
      url,
      body: requestJson,
    );

    final String responseJson = response.body;
    final Map<String, dynamic> responseRaw = jsonDecode(responseJson);
    final Map<String, dynamic> clientJson = responseRaw['client'];
    final ClientEntity updatedClient = ClientEntity.fromJson(clientJson);

    return updatedClient;
  }
}
