// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:banking_client/domain/domain.dart' as _i5;
import 'package:banking_client/features/edit_user/src/screen/edit_user_screen.dart'
    as _i1;
import 'package:banking_client/features/home/src/home_screen.dart' as _i2;
import 'package:banking_client/features/users/src/screen/users_screen.dart'
    as _i3;
import 'package:flutter/material.dart' as _i6;

abstract class $EditUserModule extends _i4.AutoRouterModule {
  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    EditUserRoute.name: (routeData) {
      final args = routeData.argsAs<EditUserRouteArgs>(
          orElse: () => const EditUserRouteArgs());
      return _i4.AutoRoutePage<_i5.User>(
        routeData: routeData,
        child: _i1.EditUserScreen(
          key: args.key,
          initialData: args.initialData,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    UsersRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.UsersScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.EditUserScreen]
class EditUserRoute extends _i4.PageRouteInfo<EditUserRouteArgs> {
  EditUserRoute({
    _i6.Key? key,
    _i5.User? initialData,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          EditUserRoute.name,
          args: EditUserRouteArgs(
            key: key,
            initialData: initialData,
          ),
          initialChildren: children,
        );

  static const String name = 'EditUserRoute';

  static const _i4.PageInfo<EditUserRouteArgs> page =
      _i4.PageInfo<EditUserRouteArgs>(name);
}

class EditUserRouteArgs {
  const EditUserRouteArgs({
    this.key,
    this.initialData,
  });

  final _i6.Key? key;

  final _i5.User? initialData;

  @override
  String toString() {
    return 'EditUserRouteArgs{key: $key, initialData: $initialData}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.UsersScreen]
class UsersRoute extends _i4.PageRouteInfo<void> {
  const UsersRoute({List<_i4.PageRouteInfo>? children})
      : super(
          UsersRoute.name,
          initialChildren: children,
        );

  static const String name = 'UsersRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
