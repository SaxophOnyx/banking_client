library deposit_agreement;

import 'package:navigation/navigation.dart';

import './deposit_agreement.gm.dart';

export './deposit_agreement.gm.dart';
export 'src/screen/deposit_agreement_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class DepositAgreementModule extends $DepositAgreementModule {}
