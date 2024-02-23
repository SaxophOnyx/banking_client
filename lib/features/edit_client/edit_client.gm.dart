// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:banking_client/domain/domain.dart' as _i5;
import 'package:banking_client/features/clients/src/screen/clients_screen.dart'
    as _i1;
import 'package:banking_client/features/edit_client/src/screen/edit_client_screen.dart'
    as _i2;
import 'package:banking_client/features/home/src/home_screen.dart' as _i3;
import 'package:flutter/material.dart' as _i6;

abstract class $EditClientModule extends _i4.AutoRouterModule {
  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ClientsRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ClientsScreen(),
      );
    },
    EditClientRoute.name: (routeData) {
      final args = routeData.argsAs<EditClientRouteArgs>(
          orElse: () => const EditClientRouteArgs());
      return _i4.AutoRoutePage<_i5.Client>(
        routeData: routeData,
        child: _i2.EditClientScreen(
          key: args.key,
          initialData: args.initialData,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ClientsScreen]
class ClientsRoute extends _i4.PageRouteInfo<void> {
  const ClientsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ClientsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ClientsRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EditClientScreen]
class EditClientRoute extends _i4.PageRouteInfo<EditClientRouteArgs> {
  EditClientRoute({
    _i6.Key? key,
    _i5.Client? initialData,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          EditClientRoute.name,
          args: EditClientRouteArgs(
            key: key,
            initialData: initialData,
          ),
          initialChildren: children,
        );

  static const String name = 'EditClientRoute';

  static const _i4.PageInfo<EditClientRouteArgs> page =
      _i4.PageInfo<EditClientRouteArgs>(name);
}

class EditClientRouteArgs {
  const EditClientRouteArgs({
    this.key,
    this.initialData,
  });

  final _i6.Key? key;

  final _i5.Client? initialData;

  @override
  String toString() {
    return 'EditClientRouteArgs{key: $key, initialData: $initialData}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
