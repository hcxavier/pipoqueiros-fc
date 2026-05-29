import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile/ui/view_models/betting_group_detail_view_model.dart';
import 'package:mobile/constants/styles.dart';
import 'package:mobile/components/widgets.dart';

class BettingGroupDetailPage extends StatelessWidget {
  final String bettingGroupCode;

  const BettingGroupDetailPage({super.key, required this.bettingGroupCode});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (context) {
        final vm = BettingGroupDetailViewModel();
        vm.loadGroupDetails(bettingGroupCode);
        return vm;
      },
      child: Scaffold(
        backgroundColor: AppColors.bgPrimary,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Consumer<BettingGroupDetailViewModel>(
            builder: (context, vm, child) {
              return AppBarTop(
                title: vm.groupName,
                onLeftPressed: () => Navigator.pop(context),
              );
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
                              Text(vm.groupName, style: AppFonts.titleMedium),
                              const SizedBox(height: 4),
                              Text(
                                'Criado por ${vm.creatorName}',
                                style: AppFonts.caption,
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
                    const SizedBox(height: 12),
                    const Divider(thickness: 1),
                    const SizedBox(height: 12),
                    SwitchTab(
                      selectedTabIndex: vm.selectedTabIndex,
                      onTabSelected: vm.setTab,
                      tabTitles: ['Seus palpites', 'Ranking do grupo'],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: vm.selectedTabIndex == 1
                          ? RankingBettingGroup(rankingData: vm.rankingData)
                          : PredicationBettingGroup(
                              predications: vm.predications,
                            ),
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
