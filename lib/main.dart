import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        return GetMaterialApp(
          title: "Crypto App",
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          theme: AppTheme.lightTheme(lightColorScheme),
          darkTheme: AppTheme.darkTheme(darkColorScheme),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
