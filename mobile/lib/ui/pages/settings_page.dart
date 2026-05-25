import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile/ui/view_models/login_view_model.dart';
import 'package:mobile/ui/view_models/settings_view_model.dart';
import 'package:mobile/components/widgets.dart';

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
            final vm = context.watch<SettingsViewModel>();
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
                    AvatarPerfil(
                      size: 148,
                      name: vm.profile['name'],
                      imagePath: vm.profile['imagePath'],
                      onEditTap: vm.editProfile,
                    ),
                    const SizedBox(height: 48),
                    BettingGroupParticipantsCard(
                      title: 'Tema escuro',
                      content: 'Altere o tema do App',
                      prefix: const AvatarIcon(radius: 24, icon: LucideIcons.moon),
                      suffix: Switch(
                        value: vm.themeMode == ThemeMode.dark,
                        onChanged: (value) => vm.toggleTheme(value),
                      ),
                    ),
                    BettingGroupParticipantsCard(
                      title: 'Suporte',
                      content: 'Entre em contato com o suporte',
                      prefix: const AvatarIcon(radius: 24, icon: LucideIcons.headphones),
                      onTap: vm.support,
                    ),
                    BettingGroupParticipantsCard(
                      title: 'Avaliação',
                      content: 'Deixe a sua imprensão sobre o App',
                      prefix: const AvatarIcon(radius: 24, icon: LucideIcons.star),
                      onTap: vm.rate
                    ),
                    const SizedBox(height: 4),
                    SecondaryButton(
                      text: 'SAIR DA CONTA',
                      icon: LucideIcons.logOut,
                      exit: true,
                      onPressed: () async {
                        final logout = await context.read<LoginViewModel>().logout();
                        if (logout) Navigator.pushReplacementNamed(context, '/');
                      }
                    ),
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