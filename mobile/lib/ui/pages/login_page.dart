import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/ui/view_models/login_view_model.dart';
import 'package:mobile/validators/validators.dart';
import 'package:mobile/components/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

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
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      right: 24.0,
                      top: 128.0,
                      bottom: 48.0,
                    ),
                    child: SvgPicture.asset(
                      'assets/logo/logo.svg',
                      width: 120,
                      height: 120,
                    ),
                  ),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(
                        context,
                      ).copyWith(overscroll: false),
                      child: SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        padding: const EdgeInsets.only(
                          top: 78.0,
                          left: 24.0,
                          right: 24.0,
                          bottom: 24.0,
                        ),
                        child: CardLogin(
                          formKey: _formKey,
                          children: [
                            CustomInputText(
                              controller: vm.emailController,
                              hintText: 'E-mail',
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: LucideIcons.mail,
                              validator: validateEmail,
                            ),
                            CustomInputText(
                              controller: vm.passwordController,
                              isObscure: vm.isObscure,
                              onToggle: vm.togglePasswordVisibility,
                              hintText: 'Senha',
                              keyboardType: TextInputType.text,
                              isPassword: true,
                              prefixIcon: LucideIcons.lock,
                              validator: validatePassword,
                            ),

                            PrimaryButton(
                              onPressed: vm.isLoading
                                  ? null
                                  : () async {
                                      final loginViewModel = context.read<LoginViewModel>();
                                      if (await loginViewModel.login(_formKey)) {
                                        if (context.mounted) {
                                          Navigator.pushReplacementNamed(
                                            context,
                                            '/home',
                                          );
                                        }
                                      } else {
                                        final error = loginViewModel.errorMessage;
                                        if (context.mounted && error != null) {
                                          SlackMessage.show(
                                            context,
                                            error,
                                            title: 'Erro de Conexão',
                                          );
                                        }
                                      }
                                    },
                              text: vm.isLoading ? 'ENTRANDO...' : 'ENTRAR',
                            ),
                            GoogleButton(
                              onPressed: () async {
                                if (await vm.googleLogin()) {
                                  if (context.mounted) {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      '/home',
                                    );
                                  }
                                }
                              },
                              text: 'ENTRAR COM GOOGLE',
                            ),
                            SizedBox(height: 12),
                            ActionText(
                              simpleText: 'Ainda não possui uma conta? ',
                              actionText: 'Cadastre-se agora',
                              onPressed: () => {
                                Navigator.pushNamed(context, '/register'),
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
