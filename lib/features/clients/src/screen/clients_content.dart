import 'package:banking_client/core/core.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/clients_bloc.dart';
import '../widgets/details/client_details.dart';
import '../widgets/list/clients_list.dart';

class ClientsContent extends StatelessWidget {
  const ClientsContent({super.key});

  @override
  Widget build(BuildContext context) {
    const double buttonSpacer = 40;

    final ClientsBloc bloc = context.read<ClientsBloc>();

    return PageTemplate(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: BlocBuilder<ClientsBloc, ClientsState>(
              builder: (BuildContext context, ClientsState state) {
                return ClientList(
                  items: state.clients,
                  index: state.index,
                  onActiveItemChanged: (int index) => bloc.add(SelectedClientChanged(index)),
                  onItemDoublePressed: (int index) => bloc.add(EditClientPressed(index)),
                );
              },
            ),
          ),
          const SizedBox(width: AppDimens.PAGE_CONTENT_PADDING),
          Expanded(
            flex: 5,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: BlocBuilder<ClientsBloc, ClientsState>(
                    builder: (BuildContext context, ClientsState state) {
                      return ClientDetails(
                        client: state.selectedClient,
                      );
                    },
                  ),
                ),
                const SizedBox(height: AppDimens.PAGE_CONTENT_PADDING),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    AppTextButton(
                      text: LocaleKeys.clients_buttons_editClient.translate(),
                      onPressed: () => bloc.add(const EditClientPressed()),
                    ),
                    const SizedBox(width: buttonSpacer),
                    AppButton(
                      text: LocaleKeys.clients_buttons_createClient.translate(),
                      onPressed: () => bloc.add(const CreateClientPressed()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
