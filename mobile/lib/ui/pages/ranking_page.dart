import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile/ui/view_models/ranking_view_model.dart';
import 'package:mobile/components/widgets.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RankingViewModel(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppBarTop(title: 'Ranking'),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Consumer<RankingViewModel>(
                builder: (context, vm, child) {
                  return Column(
                    children: [
                      SizedBox(height: 24),
                      SwitchTab(
                        selectedTabIndex: vm.selectedTabIndex,
                        onTabSelected: vm.setTab,
                        tabTitles: ['Cidade', 'Estado', 'Brasil'],
                      ),
                      const SizedBox(height: 12),
                      Divider(thickness: 1),
                      const SizedBox(height: 12),
                      Expanded(
                        child: switch (vm.selectedTabIndex) {
                          0 => RankingBettingGroup(rankingData: vm.cityRanking),
                          1 => RankingBettingGroup(rankingData: vm.stateRanking),
                          2 => RankingBettingGroup(rankingData: vm.nationalRanking),
                          _ => Container(),
                        },
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