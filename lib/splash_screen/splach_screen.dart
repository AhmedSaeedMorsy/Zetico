import 'dart:async';
import 'package:flutter/material.dart';

import '../app/resources/assets_manager.dart';
import '../app/resources/color_manager.dart';
import '../app/resources/constants_manager.dart';
import '../app/resources/routes_manager.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  void _startDelay() {
    _timer = Timer(
      const Duration(
        seconds: AppConstants.splashTime,
      ),
      _nextScreen,
    );
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: Image(
          image: AssetImage(
            AssetsManager.splashIcon,
          ),
        ),
      ),
    );
  }

  void _nextScreen() {
    Navigator.pushReplacementNamed(
      context,
      Routes.loginRoute,
    );
  }
}
