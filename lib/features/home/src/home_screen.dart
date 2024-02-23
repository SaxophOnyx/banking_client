import 'package:banking_client/core/core.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:banking_client/navigation/navigation.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return AutoTabsRouter(
      routes: const <PageRouteInfo>[
        UsersRoute(),
      ],
      builder: (BuildContext context, Widget? child) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          appBar: AppNavigationBar(
            index: tabsRouter.activeIndex,
            items: <String>[
              LocaleKeys.users_title.translate(),
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
