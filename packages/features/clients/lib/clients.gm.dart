// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:clients/src/screen/clients_screen.dart' as _i1;

abstract class $ClientsModule extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    ClientsRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ClientsScreen(),
      );
    }
  };
}

/// generated route for
/// [_i1.ClientsScreen]
class ClientsRoute extends _i2.PageRouteInfo<void> {
  const ClientsRoute({List<_i2.PageRouteInfo>? children})
      : super(
          ClientsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ClientsRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
