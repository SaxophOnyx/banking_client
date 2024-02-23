// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:deposit/src/screen/deposit_screen.dart' as _i1;

abstract class $DepositModule extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    DepositRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DepositScreen(),
      );
    }
  };
}

/// generated route for
/// [_i1.DepositScreen]
class DepositRoute extends _i2.PageRouteInfo<void> {
  const DepositRoute({List<_i2.PageRouteInfo>? children})
      : super(
          DepositRoute.name,
          initialChildren: children,
        );

  static const String name = 'DepositRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
