// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ClientsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ClientsScreen(),
      );
    },
    EditClientRoute.name: (routeData) {
      final args = routeData.argsAs<EditClientRouteArgs>(
          orElse: () => const EditClientRouteArgs());
      return AutoRoutePage<Client>(
        routeData: routeData,
        child: EditClientScreen(
          key: args.key,
          initialData: args.initialData,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    ...HomeModule().pagesMap,
    ...ClientsModule().pagesMap,
    ...EditClientModule().pagesMap,
  };
}

/// generated route for
/// [ClientsScreen]
class ClientsRoute extends PageRouteInfo<void> {
  const ClientsRoute({List<PageRouteInfo>? children})
      : super(
          ClientsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ClientsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditClientScreen]
class EditClientRoute extends PageRouteInfo<EditClientRouteArgs> {
  EditClientRoute({
    Key? key,
    Client? initialData,
    List<PageRouteInfo>? children,
  }) : super(
          EditClientRoute.name,
          args: EditClientRouteArgs(
            key: key,
            initialData: initialData,
          ),
          initialChildren: children,
        );

  static const String name = 'EditClientRoute';

  static const PageInfo<EditClientRouteArgs> page =
      PageInfo<EditClientRouteArgs>(name);
}

class EditClientRouteArgs {
  const EditClientRouteArgs({
    this.key,
    this.initialData,
  });

  final Key? key;

  final Client? initialData;

  @override
  String toString() {
    return 'EditClientRouteArgs{key: $key, initialData: $initialData}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
