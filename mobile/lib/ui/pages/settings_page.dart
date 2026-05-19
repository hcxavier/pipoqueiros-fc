import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile/components/avatars/avatar_icon.dart';
import 'package:mobile/components/cards/betting_group_participants_card.dart';
import 'package:mobile/ui/view_models/login_view_model.dart';
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
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Builder(
          builder: (context) {
            final vm = context.watch<LoginViewModel>();
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
                    SizedBox(height: 24),
                    AvatarPerfil(size: 148, name: 'Teste',),
                    SizedBox(height: 48),
                    BettingGroupParticipantsCard(title: 'Tema escuro', content: 'Altere o tema do App', prefix: AvatarIcon(radius: 24, icon: LucideIcons.moon), suffix: Switch(value: true, onChanged: (value) {})),
                    BettingGroupParticipantsCard(title: 'Suporte', content: 'Entre em contato com o suporte', prefix: AvatarIcon(radius: 24, icon: LucideIcons.headphones), onTap: () => {}),
                    BettingGroupParticipantsCard(title: 'Avaliação', content: 'Deixe a sua imprensão sobre o App', prefix: AvatarIcon(radius: 24, icon: LucideIcons.star), onTap: () {}),
                    SizedBox(height: 4),
                    SecondaryButton(text: 'SAIR DA CONTA', icon: LucideIcons.logOut, exit: true, onPressed: () => {}),
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
