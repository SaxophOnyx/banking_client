import 'package:banking_client/data/data.dart';
import 'package:banking_client/domain/domain.dart';

class UserRepositoryImpl implements UserRepository {
  final UserProvider _userProvider;

  const UserRepositoryImpl({
    required UserProvider userProvider,
  }) : _userProvider = userProvider;

  @override
  Future<User> createUser(UserDTO payload) async {
    return _userProvider.createUser(payload);
  }

  @override
  Future<List<User>> queryUsers() async {
    final List<User> users = List<User>.empty(growable: true);

    final List<int> ids = await _userProvider.queryUserIDs();

    for (final int id in ids) {
      final User user = await _userProvider.queryUserById(id);
      users.add(user);
    }

    return users;
  }

  @override
  Future<User> updateUser({
    required int id,
    required UserDTO data,
  }) async {
    return _userProvider.updateUser(
      id: id,
      data: data,
    );
  }
}
