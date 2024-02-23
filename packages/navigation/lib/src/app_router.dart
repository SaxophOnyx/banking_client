import 'package:auto_route/auto_route.dart';
import 'package:clients/clients.dart';
import 'package:deposit/deposit.dart';
import 'package:edit_client/edit_client.dart';
import 'package:home/home.dart';

import 'route_builder.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(modules: <Type>[
  HomeModule,
  ClientsModule,
  EditClientModule,
  DepositModule,
])
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          initial: true,
          page: HomeRoute.page,
          children: <AutoRoute>[
            AutoRoute(
              initial: true,
              page: ClientsRoute.page,
            ),
            AutoRoute(
              page: DepositRoute.page,
            ),
          ],
        ),
        CustomRoute(
          page: EditClientRoute.page,
          customRouteBuilder: RouteBuilder.dismissibleDialog,
        ),
      ];
}
