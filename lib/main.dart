import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

Future<void> main() async {
  await appInit();
  runApp(const MyApp());
}

Future<void> appInit() async {
  // await Get.putAsync(() => GlobalConfigService().init());
  // await Get.putAsync(SettingsService()).init();
}

final logger = Logger();

class LogWriter {
  static write(String text, {bool isError = false}) {
    Future.microtask(() => logger.d('$text. isError: [$isError]'));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // enableLog: true,
          // logWriterCallback: LogWriter.write,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          translationsKeys: AppTranslation.translations,
          locale:
              const Locale('zh', 'CN'), // ui.window.locale = Get.deviceLocale
          fallbackLocale: const Locale('zh', 'CN'),
        );
      },
    );
  }
}
