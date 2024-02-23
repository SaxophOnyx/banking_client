import 'dart:convert';

import 'package:banking_client/data/data.dart';
import 'package:banking_client/domain/domain.dart';
import 'package:http/http.dart';

class RemoveUserProvider implements UserProvider {
  final String _baseUrl;

  const RemoveUserProvider({
    required String baseUrl,
  }) : _baseUrl = baseUrl;

  @override
  Future<User> queryUserById(int id) async {
    final String rawUrl = '$_baseUrl/api/client/$id';
    final Uri url = Uri.parse(rawUrl);

    final Response response = await get(url);

    final String responseJson = response.body;
    final Map<String, dynamic> responseRaw = jsonDecode(responseJson);
    final User updatedUser = User.fromJson(responseRaw['client']);

    return updatedUser;
  }

  @override
  Future<List<int>> queryUserIDs() async {
    final String rawUrl = '$_baseUrl/api/client';
    final Uri url = Uri.parse(rawUrl);

    final Response response = await get(url);
    final List<dynamic> ids = jsonDecode(response.body);

    return ids.cast<int>();
  }

  @override
  Future<User> createUser(UserDTO dto) async {
    final String rawUrl = '$_baseUrl/api/client';
    final Uri url = Uri.parse(rawUrl);

    final Map<String, dynamic> requestRaw = <String, dynamic>{'client': dto.toJson()};
    final String requestJson = jsonEncode(requestRaw);

    final Response response = await post(
      url,
      body: requestJson,
    );

    final String responseJson = response.body;
    final Map<String, dynamic> responseRaw = jsonDecode(responseJson);
    final Map<String, dynamic> userJson = responseRaw['client'];
    final User updatedUser = User.fromJson(userJson);

    return updatedUser;
  }

  @override
  Future<User> updateUser({
    required int id,
    required UserDTO data,
  }) async {
    final String rawUrl = '$_baseUrl/api/client/$id';
    final Uri url = Uri.parse(rawUrl);

    final Map<String, dynamic> requestRaw = <String, dynamic>{'client': data.toJson()};
    final String requestJson = jsonEncode(requestRaw);

    final Response response = await put(
      url,
      body: requestJson,
    );

    final String responseJson = response.body;
    final Map<String, dynamic> responseRaw = jsonDecode(responseJson);
    final Map<String, dynamic> userJson = responseRaw['client'];
    final User updatedUser = User.fromJson(userJson);

    return updatedUser;
  }
}
