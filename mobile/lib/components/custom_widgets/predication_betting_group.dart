import 'package:flutter/material.dart';
import 'package:mobile/components/custom_widgets/list_predications.dart';
import 'package:mobile/components/widgets.dart';
import 'package:mobile/constants/styles.dart';
import 'package:mobile/ui/view_models/predication_betting_group_view_model.dart';
import 'package:provider/provider.dart';

class PredicationBettingGroup extends StatefulWidget {
  final List<Map<String, dynamic>> predications;

  const PredicationBettingGroup({super.key, required this.predications});

  @override
  State<PredicationBettingGroup> createState() => _PredicationBettingGroupState();
}

class _PredicationBettingGroupState extends State<PredicationBettingGroup> {
  @override
  Widget build(BuildContext context) {
    return widget.predications.isEmpty ?
    Center(
      child: Text(
        'Você ainda não deu\nnenhum palpite.',
        textAlign: TextAlign.center,
        style: AppFonts.caption,
      ),
    )
    : ChangeNotifierProvider(
      create: (context) => PredicationBettingGroupViewModel(widget.predications),
      child: Builder(
        builder: (context) {
          final vm = context.watch<PredicationBettingGroupViewModel>();
          return Column(
              children: [
                SwitchTab(
                  selectedTabIndex: vm.selectedTabIndex,
                  onTabSelected: vm.setTab,
                  tabTitles: ['Resultado', 'Placar'],
                  isSmall: true,
                ),
              const SizedBox(height: 16),
              Expanded(
                child: vm.selectedTabIndex == 0
                  ? ListPredications(predications: vm.predicationsMatchResult)
                  : ListPredications(predications: vm.predicationsExactScore),
              ),
            ],
          );
        }
      ),
    );
  }
}