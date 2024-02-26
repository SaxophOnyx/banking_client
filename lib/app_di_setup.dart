import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:navigation/navigation.dart';

void setupAppDI() {
  // const String baseUrl = 'http://192.168.160.177:8080';
  const String baseUrl = 'http://25.74.130.168:8080';
  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  _setupNavigation(rootNavigatorKey);
  _setupProviders(baseUrl);
  _setupRepositories();
  _setupUseCases();
}

void _setupNavigation(GlobalKey<NavigatorState> rootNavigatorKey) {
  appDi.registerSingleton<AppRouter>(
    AppRouter(navigatorKey: rootNavigatorKey),
  );
}

void _setupProviders(String baseUrl) {
  appDi.registerSingleton<ClientProvider>(
    RemoveClientProvider(baseUrl: baseUrl),
  );

  appDi.registerSingleton<DepositProvider>(
    RemoteDepositProvider(baseUrl: baseUrl),
  );
}

void _setupRepositories() {
  appDi.registerSingleton<ClientRepository>(
    ClientRepositoryImpl(
      clientProvider: appDi.get<ClientProvider>(),
    ),
  );

  appDi.registerSingleton<DepositRepository>(
    DepositRepositoryImpl(
      depositProvider: appDi.get<DepositProvider>(),
    ),
  );
}

void _setupUseCases() {
  appDi.registerSingleton<GetClientsUseCase>(
    GetClientsUseCase(
      clientRepository: appDi.get<ClientRepository>(),
    ),
  );

  appDi.registerSingleton<ObserveClientsUseCase>(
    ObserveClientsUseCase(
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

  appDi.registerSingleton<GetDepositsByClientIdUseCase>(
    GetDepositsByClientIdUseCase(
      depositRepository: appDi.get<DepositRepository>(),
    ),
  );

  appDi.registerSingleton<AddDepositUseCase>(
    AddDepositUseCase(
      depositRepository: appDi.get<DepositRepository>(),
    ),
  );

  appDi.registerSingleton<CloseBankDayUseCase>(
    CloseBankDayUseCase(
      depositRepository: appDi.get<DepositRepository>(),
    ),
  );
}
