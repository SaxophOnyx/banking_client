import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'deposit_list_item.dart';

class DepositList extends StatelessWidget {
  final Client? client;
  final List<Deposit> items;
  final int index;
  final void Function(int index) onActiveItemChanged;

  const DepositList({
    super.key,
    required this.client,
    required this.items,
    required this.index,
    required this.onActiveItemChanged,
  });

  @override
  Widget build(BuildContext context) {
    final String? emptyLabel = client == null
        ? LocaleKeys.deposit_noClientSelected.translate()
        : items.isEmpty
            ? LocaleKeys.deposit_noDepositsFound.translate()
            : null;

    return DecoratedContainer(
      label: LocaleKeys.deposit_depositList.translate(),
      child: emptyLabel != null
          ? EmptyContainerContent(text: emptyLabel)
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int i) {
                final Deposit deposit = items[i];
                final bool isSelected = i == index;
                final String title = deposit.agreementNumber;

                return DepositListItem(
                  title: title,
                  subtitle: deposit.id.toString(),
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
