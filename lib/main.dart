import 'package:final_project/core/localization/locale_manager.dart';
import 'package:final_project/core/theme/theme_manager.dart';
import 'package:final_project/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_)=>ThemeManager()),
          ChangeNotifierProvider(create: (_)=>LocalizationManager())
        ],
      child: Consumer2<ThemeManager,LocalizationManager>(
      builder: (context,themeManager,localManager,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeManager.themeMode,
          title: "Clone",
          locale: localManager.deviceLocale,
          localizationsDelegates: const[
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const[
            Locale('en'),
            Locale('tr'),
          ],
          home: const HomePage(),
        );
      },
    ),
    );
  }
}

