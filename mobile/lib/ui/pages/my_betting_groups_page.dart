import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile/ui/view_models/my_betting_groups_view_model.dart';
import 'package:mobile/constants/styles.dart';
import 'package:mobile/validators/validators.dart';
import 'package:mobile/components/widgets.dart';

class MyBettingGroupsPage extends StatefulWidget {
  const MyBettingGroupsPage({super.key});

  @override
  State<MyBettingGroupsPage> createState() => _MyBettingGroupsPageState();
}

class _MyBettingGroupsPageState extends State<MyBettingGroupsPage> {
  final _formKey = GlobalKey<FormState>();

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
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomInputText(
                              controller: vm.searchController,
                              hintText: 'Qual o nome do bolão?',
                              keyboardType: TextInputType.text,
                              prefixIcon: LucideIcons.users,
                              validator: nameBettingGroupSearchValidator,
                            ),
                            const SizedBox(height: 16),
                            PrimaryButton(
                              text: 'BUSCAR BOLÃO PELO NOME',
                              icon: LucideIcons.search,
                              onPressed: () {vm.searchBettingGroups(_formKey);},
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Divider(thickness: 1),
                      const SizedBox(height: 8),
                      Expanded(
                        child: _buildContent(vm),
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

  Widget _buildContent(MyBettingGroupsViewModel vm) {
    if (vm.isLoading) return const Center(child: CircularProgressIndicator(color: AppColors.yellowPrimary));
    if (vm.myGroups.isEmpty) return const Center(child: Text('Nenhum bolão encontrado.', style: TextStyle(color: Colors.white70, fontSize: 16)));
    return ListView.builder(
      itemCount: vm.myGroups.length,
      itemBuilder: (context, index) => _buildGroupCard(context, vm.myGroups[index]),
    );
  }

  Widget _buildGroupCard(BuildContext context, Map<String, dynamic> group) {
    return BettingGroupParticipantsCard(
      title: group['title'],
      content: 'Criado por ${group['creator']}',
      suffix: AvatarStack(
        imageUrls: List<String>.from(group['avatars'] ?? []),
        additionalCount: group['additionalCount'] ?? 0,
      ),
      onTap: () => Navigator.pushNamed(context, '/detail-betting-group', arguments: group['id']),
    );
  }
}