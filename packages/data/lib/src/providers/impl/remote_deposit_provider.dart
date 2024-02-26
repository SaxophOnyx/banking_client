import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../data.dart';

class RemoteDepositProvider implements DepositProvider {
  final String _baseUrl;

  const RemoteDepositProvider({
    required String baseUrl,
  }) : _baseUrl = baseUrl;

  @override
  Future<DepositEntity> getDeposit({
    required String clientId,
    required String depositId,
  }) async {
    final String rawUrl = '$_baseUrl/api/client/$clientId/deposit/$depositId';
    final Uri url = Uri.parse(rawUrl);

    final http.Response response = await http.get(url);
    final Map<String, dynamic> responseJson = jsonDecode(response.body);
    final Map<String, dynamic> rawEntity = responseJson['deposits'];

    return DepositEntity.fromJson(rawEntity);
  }

  @override
  Future<List<String>> getDepositIDsByClientId(String id) async {
    final String rawUrl = '$_baseUrl/api/client/$id/deposit';
    final Uri url = Uri.parse(rawUrl);

    final http.Response response = await http.get(url);
    final List<dynamic> ids = jsonDecode(response.body);

    return ids.cast<String>();
  }

  @override
  Future<DepositEntity> addDeposit({
    required String clientId,
    required DepositDTOEntity dto,
  }) async {
    final String rawUrl = '$_baseUrl/api/client/$clientId/deposit';
    final Uri url = Uri.parse(rawUrl);

    final Map<String, dynamic> requestData = dto.toJson();
    final String encodedData = jsonEncode(<String, dynamic>{'deposit': requestData});

    final http.Response response = await http.post(url, body: encodedData);

    // TODO(SaxophOnyx): Implement
    throw UnimplementedError();
  }
}
