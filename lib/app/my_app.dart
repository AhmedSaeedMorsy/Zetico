// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/app/resources/language_manager.dart';
import 'package:zetico/app/resources/routes_manager.dart';
import 'package:zetico/app/resources/theme_manager.dart';
import 'package:zetico/login_screen/controller/login_bloc.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocProvider(
            create: (context) => LoginBloc()
              ..getCurrentPosition()
              ..getLongitudeAndLatitude(),
            child: MaterialApp(
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              debugShowCheckedModeBanner: false,
              theme: getAppTheme(),
              initialRoute: Routes.splashRoute,
              onGenerateRoute: RouteGenerator.getRoute,
            ),
          );
        });
  }
}
