import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training_project/presentation/pages/test.dart';

import 'assets/locale/codegen_loader.g.dart';
import 'helper/helper_export.dart';
import 'helper/utils/colors.dart';
import 'helper/utils/constants.dart';
import 'helper/utils/global.dart';
import 'helper/utils/navigate.dart';
import 'helper/utils/preference.dart';

Future<void> main() async {

  // * Ensure Widget Initialized
  WidgetsFlutterBinding.ensureInitialized();

  // * Initialize SharedPreference
  await AppPreference.init();

  // * Ensure Easy Localization Initialized
  await EasyLocalization.ensureInitialized();

  // * Show Status Bar After Splash Screen
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );

  // * Run App
  runApp(
    EasyLocalization(
        path: Assets.localePath,
        assetLoader: const CodegenLoader(),
        supportedLocales: Translate.supportedLanguage,
        startLocale: Translate.defaultLanguage,
        fallbackLocale: Translate.englishLanguage,
        child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      navigatorKey: navigatorKey,
     localizationsDelegates: context.localizationDelegates,
     locale: context.locale,
     supportedLocales: context.supportedLocales,
      theme: ThemeData(
        primaryColor: primaryColor,
        primarySwatch: getPrimaryMaterialColor(primaryColor),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: getCurrentLanguage(context) ? 'Baloo' : 'Khmer',
      ),
      home: const Testing(),
    );
  }
}

