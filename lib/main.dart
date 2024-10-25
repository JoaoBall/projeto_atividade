import 'package:flutter/material.dart';
import 'package:intl/intl_standalone.dart';
import 'package:projeto_atividade/util/constants.dart';
import 'package:projeto_atividade/util/color_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:projeto_atividade/page/import/import_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // User system locale
  await findSystemLocale();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  static ThemeData themeData = ThemeData(
    useMaterial3: false,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: ColorHelper.swatchColor,
      accentColor: ColorHelper.accentColor,
    ).copyWith(
      secondary: ColorHelper.accentColor,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APP_NAME,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: const ImportPage(),
      builder: EasyLoading.init(),
    );
  }
}
