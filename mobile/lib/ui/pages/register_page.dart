import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/ui/view_models/login_view_model.dart';
import 'package:mobile/validators/validators.dart';
import 'package:mobile/components/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                      top: 36.0,
                      bottom: 24.0,
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
                          top: 0.0,
                          left: 24.0,
                          right: 24.0,
                          bottom: 24.0,
                        ),
                        child: CardLogin(
                          formKey: _formKey,
                          children: [
                            CustomInputText(
                              controller: vm.nameController,
                              hintText: 'Nome',
                              keyboardType: TextInputType.text,
                              prefixIcon: LucideIcons.user,
                              validator: validateName,
                            ),
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
                            CustomInputText(
                              controller: vm.confirmPasswordController,
                              isObscure: vm.isObscureConfirmation,
                              onToggle: vm.toggleConfirmPasswordVisibility,
                              hintText: 'Confirme sua senha',
                              keyboardType: TextInputType.text,
                              isPassword: true,
                              prefixIcon: LucideIcons.checkCheck,
                              validator: (value) => validateConfirmPassword(
                                value,
                                vm.passwordController.text,
                              ),
                            ),
                            SecondaryButton(
                              onPressed: vm.isLocationLoading
                                  ? null
                                  : vm.getLocation,
                              text: vm.isLocationLoading
                                  ? 'OBTENDO LOCALIZAÇÃO...'
                                  : 'OBTER LOCALIZAÇÃO',
                              icon: LucideIcons.mapPin,
                            ),
                            CustomInputText(
                              controller: vm.locationController,
                              hintText: 'Seu estado e cidade',
                              keyboardType: TextInputType.text,
                              prefixIcon: LucideIcons.home,
                              validator: locationValidator,
                            ),
                            if (vm.errorMessage != null)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Container(
                                  padding: const EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.red.withOpacity(0.5),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        LucideIcons.alertCircle,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          vm.errorMessage!,
                                          style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            PrimaryButton(
                              onPressed: vm.isLoading
                                  ? null
                                  : () async {
                                      if (await vm.register(_formKey)) {
                                        if (context.mounted) {
                                          Navigator.pushReplacementNamed(
                                            context,
                                            '/home',
                                          );
                                        }
                                      }
                                    },
                              text: vm.isLoading
                                  ? 'CADASTRANDO...'
                                  : 'CADASTRAR',
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
                              text: 'CADASTRAR COM GOOGLE',
                            ),
                            SizedBox(height: 0),
                            ActionText(
                              simpleText: 'Já possui uma conta? ',
                              actionText: 'Entre agora',
                              onPressed: () => {
                                Navigator.pushNamed(context, '/'),
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
