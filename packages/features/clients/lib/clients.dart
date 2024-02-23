library clients;

import 'package:auto_route/auto_route.dart';

import './clients.gm.dart';

export './clients.gm.dart';
export './src/screen/clients_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class ClientsModule extends $ClientsModule {}
