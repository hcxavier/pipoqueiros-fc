import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile/ui/view_models/search_betting_group_view_model.dart';
import 'package:mobile/constants/styles.dart';
import 'package:mobile/components/widgets.dart';
import 'package:mobile/validators/validators.dart';

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
                            style: AppFonts.titleLarge.copyWith(height: 1.3),
                          ),
                          const SizedBox(height: 48),
                          CustomInputText(
                            prefixIcon: LucideIcons.key,
                            controller: vm.codeController,
                            hintText: 'Qual o código do bolão?',
                            keyboardType: TextInputType.text,
                            validator: codeBettingGroupValidator,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: PrimaryButton(
                                  text: 'BUSCAR POR CÓDIGO',
                                  icon: LucideIcons.search,
                                  onPressed: () async {
                                    final bettingGroupId = await vm.searchGroup(_formKey);
                                    if (bettingGroupId != null) {
                                      Navigator.pushNamed(context, '/detail-betting-group', arguments: bettingGroupId);
                                    } else {
                                      final screenHeight = MediaQuery.of(context).size.height;
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: const Text('Bolão não encontrado'),
                                          behavior: SnackBarBehavior.floating,
                                          margin: EdgeInsets.only(
                                            bottom: screenHeight - 250,
                                            left: 16,
                                            right: 16,
                                          ),
                                          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 24),
                                          dismissDirection: DismissDirection.up,
                                          elevation: 0,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              SecondaryButton(
                                square: true,
                                icon: LucideIcons.qrCode,
                                onPressed: () {}, // Implementar funcionalidade de leitura de QR Code
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