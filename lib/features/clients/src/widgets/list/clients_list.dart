import 'package:banking_client/core/core.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:banking_client/domain/domain.dart';
import 'package:flutter/material.dart';

import '../shared/decorated_container.dart';
import 'client_list_item.dart';

class ClientList extends StatelessWidget {
  final List<Client> items;
  final int index;
  final void Function(int index) onActiveItemChanged;
  final void Function(int index) onItemDoublePressed;

  const ClientList({
    super.key,
    required this.items,
    required this.index,
    required this.onActiveItemChanged,
    required this.onItemDoublePressed,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return DecoratedContainer(
      label: LocaleKeys.clients_clientsList.translate(),
      child: items.isEmpty
          ? Center(
              child: Text(
                LocaleKeys.clients_noClientsFound.translate(),
                style: AppFonts.sansSerif16Normal.copyWith(
                  color: colors.textLight,
                ),
              ),
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
                  onDoublePressed: () => onItemDoublePressed(i),
                );
              },
            ),
    );
  }
}
