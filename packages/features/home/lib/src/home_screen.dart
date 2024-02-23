import 'package:clients/clients.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:deposit/deposit.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return AutoTabsRouter(
      routes: const <PageRouteInfo>[
        ClientsRoute(),
        DepositRoute(),
      ],
      builder: (BuildContext context, Widget? child) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          appBar: AppNavigationBar(
            index: tabsRouter.activeIndex,
            items: <String>[
              LocaleKeys.clients_title.translate(),
              LocaleKeys.deposit_title.translate(),
            ],
            onItemPressed: (int index) => tabsRouter.setActiveIndex(index),
          ),
          backgroundColor: colors.background,
          body: child,
        );
      },
    );
  }
}
