import 'package:auto_route/auto_route.dart';
import 'package:banking_client/domain/domain.dart';
import 'package:banking_client/features/clients/clients.dart';
import 'package:banking_client/features/edit_client/edit_client.dart';
import 'package:banking_client/features/home/home.dart';
import 'package:flutter/foundation.dart';

import 'route_builder.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(modules: <Type>[
  HomeModule,
  ClientsModule,
  EditClientModule,
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
          ],
        ),
        CustomRoute(
          page: EditClientRoute.page,
          customRouteBuilder: RouteBuilder.dismissibleDialog,
        ),
      ];
}
