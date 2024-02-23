import 'package:banking_client/domain/domain.dart';

typedef UpdateUserPayload = ({int id, UserDTO data});

class UpdateUserUseCase extends FutureUseCase<UpdateUserPayload, void> {
  final UserRepository _userRepository;

  const UpdateUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<User> execute(UpdateUserPayload payload) {
    return _userRepository.updateUser(
      id: payload.id,
      data: payload.data,
    );
  }
}
