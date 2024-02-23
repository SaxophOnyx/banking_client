import 'package:banking_client/navigation/navigation.dart';

import './clients.gm.dart';

export './clients.gm.dart';
export './src/screen/clients_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class ClientsModule extends $ClientsModule {}
