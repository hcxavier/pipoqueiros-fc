import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile/ui/view_models/new_betting_group_view_model.dart';
import 'package:mobile/constants/styles.dart';
import 'package:mobile/validators/validators.dart';
import 'package:mobile/components/widgets.dart';

class NewBettingGroupPage extends StatefulWidget {
  const NewBettingGroupPage({super.key});

  @override
  State<NewBettingGroupPage> createState() => _NewBettingGroupPageState();
}

class _NewBettingGroupPageState extends State<NewBettingGroupPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewBettingGroupViewModel(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Builder(
            builder: (context) {
              final vm = context.watch<NewBettingGroupViewModel>();
              return Scaffold(
                appBar: const PreferredSize(
                  preferredSize: Size.fromHeight(kToolbarHeight),
                  child: AppBarTop(title: 'Criar novo bolão'),
                ),
                body: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 32),
                          const IconsHome(),
                          const SizedBox(height: 48),
                          Text(
                            'Crie seu próprio bolão do brasileirão e compartilhe entre amigos!',
                            textAlign: TextAlign.center,
                            style: AppFonts.titleLarge,
                          ),
                          const SizedBox(height: 48),
                          CustomInputText(
                            prefixIcon: LucideIcons.trophy,
                            controller: vm.nameController,
                            hintText: 'Qual nome do seu bolão?',
                            keyboardType: TextInputType.text,
                            validator: nameBettingGroupValidator,
                          ),
                          const SizedBox(height: 16),
                          PrimaryButton(
                            text: 'CRIAR MEU BOLÃO',
                            isLoading: vm.isLoading,
                            onPressed: () async {
                              final bettingGroupId = await vm.createGroup(_formKey);
                              if (bettingGroupId != null) {
                                Navigator.pushNamed(context, '/detail-betting-group', arguments: bettingGroupId);
                              }
                            },
                          ),
                          const SizedBox(height: 32),
                          Text(
                            'Após criar seu bolão, você receberá um\ncódigo único que poderá usar para convidar\noutras pessoas.',
                            textAlign: TextAlign.center,
                            style: AppFonts.caption.copyWith(height: 1.5),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}