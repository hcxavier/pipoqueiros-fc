import 'package:flutter/material.dart';
import 'package:mobile/ui/view_models/share_betting_group_view_model.dart';
import 'package:provider/provider.dart';
import 'package:mobile/constants/styles.dart';
import 'package:mobile/components/widgets.dart';

class ShareBettingGroup extends StatelessWidget {
  final String bettingGroupCode;

  const ShareBettingGroup({super.key, required this.bettingGroupCode});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (context) {
        final vm = ShareBettingGroupViewModel();
        return vm;
      },
      child: Scaffold(
        backgroundColor: AppColors.bgPrimary,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBarTop(
            title: 'Compartilhar Bolão',
            onLeftPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: Consumer<ShareBettingGroupViewModel>(
            builder: (context, vm, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 48),
                    Text(
                      'Escaneie o QR Code abaixo para acessar o bolão e começar a palpitar!',
                      style: AppFonts.caption,
                      textAlign: TextAlign.center,
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
