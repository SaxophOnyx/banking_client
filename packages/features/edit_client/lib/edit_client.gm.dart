// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:domain/domain.dart' as _i3;
import 'package:edit_client/src/screen/edit_client_screen.dart' as _i1;
import 'package:flutter/material.dart' as _i4;

abstract class $EditClientModule extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    EditClientRoute.name: (routeData) {
      final args = routeData.argsAs<EditClientRouteArgs>(
          orElse: () => const EditClientRouteArgs());
      return _i2.AutoRoutePage<_i3.Client>(
        routeData: routeData,
        child: _i1.EditClientScreen(
          key: args.key,
          initialData: args.initialData,
        ),
      );
    }
  };
}

/// generated route for
/// [_i1.EditClientScreen]
class EditClientRoute extends _i2.PageRouteInfo<EditClientRouteArgs> {
  EditClientRoute({
    _i4.Key? key,
    _i3.Client? initialData,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          EditClientRoute.name,
          args: EditClientRouteArgs(
            key: key,
            initialData: initialData,
          ),
          initialChildren: children,
        );

  static const String name = 'EditClientRoute';

  static const _i2.PageInfo<EditClientRouteArgs> page =
      _i2.PageInfo<EditClientRouteArgs>(name);
}

class EditClientRouteArgs {
  const EditClientRouteArgs({
    this.key,
    this.initialData,
  });

  final _i4.Key? key;

  final _i3.Client? initialData;

  @override
  String toString() {
    return 'EditClientRouteArgs{key: $key, initialData: $initialData}';
  }
}
