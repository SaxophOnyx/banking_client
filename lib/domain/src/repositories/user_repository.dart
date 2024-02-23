import 'package:banking_client/domain/domain.dart';

abstract class UserRepository {
  Future<List<User>> queryUsers();

  Future<User> createUser(UserDTO payload);

  Future<User> updateUser({
    required int id,
    required UserDTO data,
  });
}
