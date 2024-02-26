import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'client_list_item.dart';

class ClientList extends StatelessWidget {
  final List<Client> items;
  final int index;
  final void Function(int index) onActiveItemChanged;

  const ClientList({
    super.key,
    required this.items,
    required this.index,
    required this.onActiveItemChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      label: LocaleKeys.clients_clientList.translate(),
      child: items.isEmpty
          ? EmptyContainerContent(
              text: LocaleKeys.clients_noClientsFound.translate(),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int i) {
                final Client client = items[i];
                final bool isSelected = i == index;
                final String title = '${client.firstName} ${client.middleName} ${client.lastName}';

                return ClientListItem(
                  title: title,
                  subtitle: client.id.toString(),
                  isSelected: isSelected,
                  onPressed: () {
                    if (!isSelected) {
                      onActiveItemChanged(i);
                    }
                  },
                );
              },
            ),
    );
  }
}
