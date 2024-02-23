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

  appDi.registerSingleton<ClientProvider>(
    const RemoveClientProvider(baseUrl: baseUrl),
  );

  appDi.registerSingleton<ClientRepository>(
    ClientRepositoryImpl(
      clientProvider: appDi.get<ClientProvider>(),
    ),
  );

  appDi.registerSingleton<GetClientsUseCase>(
    GetClientsUseCase(
      clientRepository: appDi.get<ClientRepository>(),
    ),
  );

  appDi.registerSingleton<CreateClientUseCase>(
    CreateClientUseCase(
      clientRepository: appDi.get<ClientRepository>(),
    ),
  );

  appDi.registerSingleton<UpdateClientUseCase>(
    UpdateClientUseCase(
      clientRepository: appDi.get<ClientRepository>(),
    ),
  );
}
