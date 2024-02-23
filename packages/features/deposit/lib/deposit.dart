library deposit;

import 'package:auto_route/auto_route.dart';

import './deposit.gm.dart';

export './deposit.gm.dart';
export 'src/screen/deposit_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class DepositModule extends $DepositModule {}
