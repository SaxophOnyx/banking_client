import 'package:banking_client/core/core.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:banking_client/domain/domain.dart';
import 'package:flutter/material.dart';

import '../shared/decorated_container.dart';
import 'client_table.dart';

class ClientDetails extends StatelessWidget {
  final Client? client;

  const ClientDetails({
    super.key,
    this.client,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;
    final Client? maybeUser = client;

    return DecoratedContainer(
      label: LocaleKeys.clients_clientDetails.translate(),
      child: maybeUser == null
          ? Center(
              child: Text(
                LocaleKeys.clients_noSelectedClient.translate(),
                style: AppFonts.sansSerif16Normal.copyWith(
                  color: colors.textLight,
                ),
              ),
            )
          : SingleChildScrollView(
              child: ClientTable(
                client: maybeUser,
              ),
            ),
    );
  }
}
