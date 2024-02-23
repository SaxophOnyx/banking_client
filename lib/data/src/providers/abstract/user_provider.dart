import 'package:banking_client/domain/domain.dart';

abstract class UserProvider {
  Future<List<int>> queryUserIDs();

  Future<User> queryUserById(int id);

  Future<User> createUser(UserDTO dto);

  Future<User> updateUser({
    required int id,
    required UserDTO data,
  });
}
