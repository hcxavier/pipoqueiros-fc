import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile/ui/view_models/login_view_model.dart';
import 'package:mobile/ui/view_models/settings_view_model.dart';
import 'package:provider/provider.dart';
import '../../components/widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
      ],
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Builder(
          builder: (context) {
            final settingsVM = context.watch<SettingsViewModel>();
            return Scaffold(
              appBar: const PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: AppBarTop(title: 'Configurações'),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  spacing: 6,
                  children: [
                    const SizedBox(height: 24),
                    const AvatarPerfil(size: 148, name: 'Teste',),
                    const SizedBox(height: 48),
                    BettingGroupParticipantsCard(
                      title: 'Tema escuro',
                      content: 'Altere o tema do App',
                      prefix: const AvatarIcon(radius: 24, icon: LucideIcons.moon),
                      suffix: Switch(
                        value: settingsVM.themeMode == ThemeMode.dark,
                        onChanged: (value) => settingsVM.toggleTheme(value),
                      ),
                    ),
                    BettingGroupParticipantsCard(title: 'Suporte', content: 'Entre em contato com o suporte', prefix: const AvatarIcon(radius: 24, icon: LucideIcons.headphones), onTap: () => {}),
                    BettingGroupParticipantsCard(title: 'Avaliação', content: 'Deixe a sua imprensão sobre o App', prefix: const AvatarIcon(radius: 24, icon: LucideIcons.star), onTap: () {}),
                    const SizedBox(height: 4),
                    SecondaryButton(text: 'SAIR DA CONTA', icon: LucideIcons.logOut, exit: true, onPressed: () => {Navigator.pushReplacementNamed(context, '/')}),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
