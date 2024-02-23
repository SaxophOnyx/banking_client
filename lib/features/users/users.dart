import 'package:banking_client/navigation/navigation.dart';

import './users.gm.dart';

export './src/screen/users_screen.dart';
export './users.gm.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class UsersModule extends $UsersModule {}
