import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile/components/widgets.dart';
import 'package:mobile/components/custom_widgets/app_bar_top.dart';
import 'package:mobile/constants/styles.dart';
import 'package:mobile/ui/view_models/search_betting_group_view_model.dart';
import 'package:mobile/validators/validators.dart';
import 'package:provider/provider.dart';

class SearchBettingGroupPage extends StatefulWidget {
  const SearchBettingGroupPage({super.key});

  @override
  State<SearchBettingGroupPage> createState() => _SearchBettingGroupPageState();
}

class _SearchBettingGroupPageState extends State<SearchBettingGroupPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchBettingGroupViewModel(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Builder(
            builder: (context) {
              final vm = context.watch<SearchBettingGroupViewModel>();

              return Scaffold(
                backgroundColor: Colors.black,
                appBar: const PreferredSize(
                  preferredSize: Size.fromHeight(kToolbarHeight),
                  child: AppBarTop(title: 'Buscar por código'),
                ),
                body: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 32.0,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Encontre um bolão através de\nseu código único',
                            textAlign: TextAlign.center,
                            style: AppFonts.titleLarge.copyWith(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 48),
                          CustomInputText(
                            prefixIcon: LucideIcons.key,
                            controller: vm.codeController,
                            hintText: 'Qual o código do bolão?',
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              return codeBettingGroupValidator(value);
                            },
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: PrimaryButton(
                                  text: 'BUSCAR POR CÓDIGO',
                                  icon: LucideIcons.search,
                                  onPressed: () async {
                                    if (await vm.searchGroup(_formKey)) {
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              SizedBox(
                                height: 56,
                                width: 56,
                                child: OutlinedButton(
                                  onPressed: () {
                                    // TODO: Implementar scanner de QR Code
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    side: const BorderSide(
                                      color: AppColors.yellowPrimary,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  child: const Icon(
                                    LucideIcons.qrCode,
                                    color: AppColors.yellowPrimary,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
