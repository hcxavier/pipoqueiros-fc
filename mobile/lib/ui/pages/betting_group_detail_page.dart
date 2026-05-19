import 'package:flutter/material.dart';
import 'package:mobile/components/custom_widgets/ranking_betting_group.dart';
import 'package:mobile/constants/styles.dart';
import 'package:mobile/ui/view_models/betting_group_detail_view_model.dart';
import 'package:provider/provider.dart';
import 'package:mobile/components/widgets.dart';

class BettingGroupDetailPage extends StatelessWidget {
  const BettingGroupDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BettingGroupDetailViewModel(),
      child: Scaffold(
        backgroundColor: AppColors.bgPrimary,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Consumer<BettingGroupDetailViewModel>(
            builder: (context, vm, child) {
              return AppBarTop(title: vm.groupName);
            },
          ),
        ),
        body: SafeArea(
          child: Consumer<BettingGroupDetailViewModel>(
            builder: (context, vm, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 24),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                vm.groupName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Criado por ${vm.creatorName}',
                                style: TextStyle(
                                  color: Colors
                                      .grey[400], // ou AppColors.textSecondary se tiver
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),

                        AvatarStack(
                          imageUrls: vm.avatars,
                          additionalCount: vm.additionalCount,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    const Divider(color: AppColors.bgTertiary, thickness: 1),

                    const SizedBox(height: 16),

                    // Toggle Tabs (Seus palpites / Ranking)
                    Container(
                      height: 50,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.bgSecondary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          BuildTabButton(
                            title: 'Seus palpites',
                            isSelected: vm.selectedTabIndex == 0,
                            onTap: () => vm.setTab(0),
                          ),
                          BuildTabButton(
                            title: 'Ranking do grupo',
                            isSelected: vm.selectedTabIndex == 1,
                            onTap: () => vm.setTab(1),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 48),

                    // Conteúdo dinâmico baseado na aba selecionada
                    Expanded(
                      child: vm.selectedTabIndex == 1
                          ? RankingBettingGroup()
                          : PredicationBettingGroup(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
