import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'client_table.dart';

class ClientDetails extends StatelessWidget {
  final Client? client;

  const ClientDetails({
    super.key,
    this.client,
  });

  @override
  Widget build(BuildContext context) {
    final Client? maybeUser = client;

    return DecoratedContainer(
      label: LocaleKeys.clients_clientDetails.translate(),
      child: maybeUser == null
          ? EmptyContainerContent(
              text: LocaleKeys.clients_noSelectedClient.translate(),
            )
          : SingleChildScrollView(
              child: ClientTable(
                client: maybeUser,
              ),
            ),
    );
  }
}
