import 'dart:convert';

import 'package:banking_client/data/data.dart';
import 'package:banking_client/domain/domain.dart';
import 'package:http/http.dart' as http;

class RemoveClientProvider implements ClientProvider {
  final String _baseUrl;

  const RemoveClientProvider({
    required String baseUrl,
  }) : _baseUrl = baseUrl;

  @override
  Future<Client> queryClientById(int id) async {
    final String rawUrl = '$_baseUrl/api/client/$id';
    final Uri url = Uri.parse(rawUrl);

    final http.Response response = await http.get(url);

    final String responseJson = response.body;
    final Map<String, dynamic> responseRaw = jsonDecode(responseJson);
    final Client updatedUser = Client.fromJson(responseRaw['client']);

    return updatedUser;
  }

  @override
  Future<List<int>> queryClientIDs() async {
    final String rawUrl = '$_baseUrl/api/client';
    final Uri url = Uri.parse(rawUrl);

    final http.Response response = await http.get(url);
    final List<dynamic> ids = jsonDecode(response.body);

    return ids.cast<int>();
  }

  @override
  Future<Client> createClient(ClientDTO dto) async {
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
    final Client updatedClient = Client.fromJson(clientJson);

    return updatedClient;
  }

  @override
  Future<Client> updateClient({
    required int id,
    required ClientDTO data,
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
    final Client updatedClient = Client.fromJson(clientJson);

    return updatedClient;
  }
}
