// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'package:flutter/material.dart';

import '../app/resources/assets_manager.dart';
import '../app/resources/color_manager.dart';
import '../app/resources/constants_manager.dart';
import '../app/resources/routes_manager.dart';
import '../app/services/shared_prefrences/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  late String routeName;
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
    var role = CacheHelper.getData(
      key: SharedKey.role,
    );
    var token = CacheHelper.getData(
      key: SharedKey.token,
    );
    ////////////////////// Check on start widget////////////////
    if (token != null) {
      if (role == "Drivers") {
        routeName = Routes.homeDriverRoute;
      } else {
        routeName = Routes.homeRoute;
      }
    } else {
      routeName = Routes.loginRoute;
    }
    Navigator.pushReplacementNamed(
      context,
      routeName,
    );
  }
}
