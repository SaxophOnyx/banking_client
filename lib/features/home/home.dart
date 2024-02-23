import 'package:banking_client/navigation/navigation.dart';

import './home.gm.dart';

export './home.gm.dart';
export 'src/home_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class HomeModule extends $HomeModule {}
