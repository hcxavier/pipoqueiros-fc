import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile/components/cards/betting_group_participants_card.dart';
import 'package:mobile/components/custom_widgets/avatar_stack.dart';
import 'package:mobile/components/widgets.dart';
import 'package:mobile/components/custom_widgets/app_bar_top.dart';
import 'package:mobile/constants/styles.dart';
import 'package:mobile/ui/view_models/my_betting_groups_view_model.dart';
import 'package:provider/provider.dart';

class MyBettingGroupsPage extends StatelessWidget {
  const MyBettingGroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyBettingGroupsViewModel(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppBarTop(title: 'Meus bolões'),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Consumer<MyBettingGroupsViewModel>(
                builder: (context, vm, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 24),

                      // input de Busca
                      CustomInputText(
                        controller: vm.searchController,
                        hintText: 'Qual o nome do bolão?',
                        keyboardType: TextInputType.text,
                        prefixIcon: LucideIcons.users,
                      ),

                      const SizedBox(height: 16),

                      PrimaryButton(
                        text: 'BUSCAR BOLÃO PELO NOME',
                        icon: LucideIcons.search,
                        onPressed: () {
                          // TODO: Usar vm.searchController.text para filtrar a lista
                          print('Buscando por: ${vm.searchController.text}');
                        },
                      ),

                      const Divider(color: Color(0xFF202024), thickness: 1),

                      const SizedBox(height: 24),

                      // lista de Bolões
                      Expanded(
                        child: vm.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.yellowPrimary,
                                ),
                              )
                            : ListView.builder(
                                itemCount: vm.myGroups.length,
                                itemBuilder: (context, index) {
                                  final group = vm.myGroups[index];
                                  return BettingGroupParticipantsCard(
                                    title: group['title'],
                                    content: 'Criado por ${group['creator']}',
                                    suffix: AvatarStack(imageUrls: group['avatars'], additionalCount: group['additionalCount']),
                                    onTap: () {},
                                  );
                                },
                              ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
