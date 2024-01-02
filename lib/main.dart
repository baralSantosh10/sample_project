
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:sample_project/utils/colors.dart';
import 'package:sample_project/views/splash_screen.dart';

import 'controller/core_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: "test_public_key_f18b878e02d64e10988f46aea7baa233",
      builder: (context, navigatorKey) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ne', 'NP'),
          ],
          localizationsDelegates: const [
            KhaltiLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: true,

          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
            useMaterial3: true,
          ),
          initialBinding: BindingsBuilder(() {
            Get.put(CoreController());
          }),
          // initialRoute: SplashScreen.routeName,
          home: SplashScreen(),
        );
      },
    );
  }
}
