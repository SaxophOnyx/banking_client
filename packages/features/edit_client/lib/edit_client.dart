library edit_client;

import 'package:auto_route/auto_route.dart';

import './edit_client.gm.dart';

export './edit_client.gm.dart';
export './src/screen/edit_client_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class EditClientModule extends $EditClientModule {}
