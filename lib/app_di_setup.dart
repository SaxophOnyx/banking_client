import 'package:banking_client/core/core.dart';
import 'package:banking_client/data/data.dart';
import 'package:banking_client/domain/domain.dart';
import 'package:banking_client/navigation/navigation.dart';
import 'package:flutter/widgets.dart';

void setupAppDI() {
  const String baseUrl = 'http://192.168.160.177:8080';
  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  appDi.registerSingleton<AppRouter>(
    AppRouter(navigatorKey: rootNavigatorKey),
  );

  appDi.registerSingleton<UserProvider>(
    const RemoveUserProvider(baseUrl: baseUrl),
  );

  appDi.registerSingleton<UserRepository>(
    UserRepositoryImpl(
      userProvider: appDi.get<UserProvider>(),
    ),
  );

  appDi.registerSingleton<GetUsersUseCase>(
    GetUsersUseCase(
      userRepository: appDi.get<UserRepository>(),
    ),
  );

  appDi.registerSingleton<CreateUserUseCase>(
    CreateUserUseCase(
      userRepository: appDi.get<UserRepository>(),
    ),
  );

  appDi.registerSingleton<UpdateUserUseCase>(
    UpdateUserUseCase(
      userRepository: appDi.get<UserRepository>(),
    ),
  );
}
