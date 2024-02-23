import 'package:banking_client/navigation/navigation.dart';

import './edit_user.gm.dart';

export './edit_user.gm.dart';
export './src/screen/edit_user_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class EditUserModule extends $EditUserModule {}
