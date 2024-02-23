import 'package:banking_client/core/core.dart';
import 'package:banking_client/domain/domain.dart';

class GetUsersUseCase extends FutureUseCase<NoParams, List<User>> {
  final UserRepository _userRepository;

  const GetUsersUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<List<User>> execute([NoParams? payload]) async {
    return _userRepository.queryUsers();
  }
}
