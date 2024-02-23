import 'package:banking_client/domain/domain.dart';

class CreateUserUseCase extends FutureUseCase<UserDTO, User> {
  final UserRepository _userRepository;

  const CreateUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<User> execute(UserDTO payload) async {
    return _userRepository.createUser(payload);
  }
}
