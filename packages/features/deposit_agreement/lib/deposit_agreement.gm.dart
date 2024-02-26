// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:deposit_agreement/src/screen/deposit_agreement_screen.dart'
    as _i1;
import 'package:domain/domain.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

abstract class $DepositAgreementModule extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    DepositAgreementRoute.name: (routeData) {
      final args = routeData.argsAs<DepositAgreementRouteArgs>();
      return _i2.AutoRoutePage<_i3.Deposit>(
        routeData: routeData,
        child: _i1.DepositAgreementScreen(
          key: args.key,
          clientId: args.clientId,
        ),
      );
    }
  };
}

/// generated route for
/// [_i1.DepositAgreementScreen]
class DepositAgreementRoute
    extends _i2.PageRouteInfo<DepositAgreementRouteArgs> {
  DepositAgreementRoute({
    _i4.Key? key,
    required String clientId,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          DepositAgreementRoute.name,
          args: DepositAgreementRouteArgs(
            key: key,
            clientId: clientId,
          ),
          initialChildren: children,
        );

  static const String name = 'DepositAgreementRoute';

  static const _i2.PageInfo<DepositAgreementRouteArgs> page =
      _i2.PageInfo<DepositAgreementRouteArgs>(name);
}

class DepositAgreementRouteArgs {
  const DepositAgreementRouteArgs({
    this.key,
    required this.clientId,
  });

  final _i4.Key? key;

  final String clientId;

  @override
  String toString() {
    return 'DepositAgreementRouteArgs{key: $key, clientId: $clientId}';
  }
}
