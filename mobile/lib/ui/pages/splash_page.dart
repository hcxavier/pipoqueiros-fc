import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/components/custom_widgets/gradient_background.dart';
import 'package:mobile/constants/styles.dart';
import 'package:mobile/ui/view_models/splash_view_model.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  Future<void> _initialize(SplashViewModel viewModel) async {
    final isConnected = await viewModel.connect();

    if (isConnected) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashViewModel(),
      child: Builder(
        builder: (context) {
          final viewModel = Provider.of<SplashViewModel>(context, listen: false);
          _initialize(viewModel);
          return Stack(
            children: [
              GradientBackground(color1: AppColors.bgLight, color2: AppColors.bgPrimary, radius: 0.8),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/logo/logo_splash.svg', width: 120, height: 120),
                    const SizedBox(height: 24.0),
                    CircularProgressIndicator()
                  ],
                ),
              ),
            ]
          );
        }
      ),
    );
  }
}