import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'deposit_content.dart';

@RoutePage()
class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DepositContent();
  }
}
