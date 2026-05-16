import 'package:flutter/material.dart';
import 'package:mobile/constants/styles.dart';
import 'package:mobile/ui/view_models/login_view_model.dart';
import 'package:provider/provider.dart';
import '../../components/widgets.dart';

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
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 128.0, bottom: 48.0),
                child: Column(
                  children: [
                    Text('Logo', style: AppFonts.titleLarge),
                  ],
                ),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    reverse: true,
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
                    child: CardLogin(
                      formKey: _formKey,
                      children: [
                        PrimaryButton(onPressed: () => {}, text: 'ENTRAR',),
                      ]
                    ),
                  )
                )
              )
            ],
          )
        ),
      )
    );
  }
}

// Scaffold(
//       backgroundColor: const Color(0xFFF6F8FC),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             children: [
//               const Spacer(),
//               Container(
//                 width: 120,
//                 height: 120,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFFFD54F),
//                   borderRadius: BorderRadius.circular(32),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Color(0x22000000),
//                       blurRadius: 24,
//                       offset: Offset(0, 12),
//                     ),
//                   ],
//                 ),
//                 child: const Icon(
//                   Icons.sports_soccer,
//                   size: 64,
//                   color: Color(0xFF1F2937),
//                 ),
//               ),
//               const SizedBox(height: 32),
//               const Text(
//                 'Bem-vindo ao Pipoqueiros FC',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.w800,
//                   color: Color(0xFF111827),
//                   height: 1.15,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Organize jogos, acompanhe o elenco e mantenha o time sempre pronto para entrar em campo.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Color(0xFF6B7280),
//                   height: 1.5,
//                 ),
//               ),
//               const SizedBox(height: 40),
//               SizedBox(
//                 width: double.infinity,
//                 height: 54,
//                 child: ElevatedButton.icon(
//                   onPressed: () async {
//                     final loginViewModel = LoginViewModel();
//                     var success = await loginViewModel.googleLogin();

//                     if (success) {
//                       Navigator.pushReplacementNamed(context, '/home');
//                     }
//                   },
//                   icon: const Icon(Icons.login),
//                   label: const Text(
//                     'Entrar com Google',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF111827),
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     elevation: 0,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Ao continuar, você concorda com os termos de uso.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Color(0xFF9CA3AF),
//                 ),
//               ),
//               const Spacer(),
//             ],
//           ),
//         ),
//       ),
//     );