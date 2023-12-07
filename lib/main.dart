import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:swooshed_app/controller/translation_controller/translation_controller.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'controller/payment_method_provider2/payment_method_provider.dart';
import 'view/SplashScreen/splashscreen.dart';
import 'view/bottom_nav_bar/nav_bar.dart';
import 'view/not_login/not_login.dart';
import 'view/on_boarding/on_boarding.dart';
import 'view/redeem_promo_code/redeem_promo_code.dart';
import 'view/sign_in/login.dart';
import 'view/sign_up/sign_up.dart';
import 'view/transaction_history/transaction_history.dart';
import 'view/varify_success_email/varify_succes_email.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => LanguageChangeController()),
            ChangeNotifierProvider(create: (_) => PaymentMethodProvider()),
          ],
          child: Consumer<LanguageChangeController>(
              builder: (context, provider, child) {
            return GetMaterialApp(
              locale: provider.appLocale,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('en'), // English
                Locale('zh'),
                Locale('de'),
                Locale('el'),
                Locale('es'),
                Locale('fil'),
                Locale('fr'),
                Locale('id'),
                Locale('it'),
                Locale('ka'),
                Locale('nl'),
                Locale('pl'),
                Locale('sk'),
                Locale('vi'),
                Locale('ro'),
              ],
              title: 'Swooshed App',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: AppBarTheme(color: AppColors.bgColor),
                useMaterial3: true,
              ),
              // home: const ChooseLanguageScreen(),
              initialRoute: '/',
              // Initial route
              getPages: [
                GetPage(name: '/', page: () => SplashScreen()),
                GetPage(name: '/OnBoarding', page: () => OnBoardingScreen()),
                GetPage(name: '/NotLoginScreen', page: () => NotLoginScreen()),
                GetPage(name: '/LoginScreen', page: () => LoginScreen()),
                GetPage(name: '/BottomNav', page: () => BottomNav()),
                GetPage(name: '/SignUpScreen', page: () => SignUpScreen()),
                GetPage(
                    name: '/VarifyAndSuccessEmail',
                    page: () => VarifyAndSuccessEmail()),
                GetPage(
                    name: '/TransactionHistory',
                    page: () => TransactionHistory()),
                GetPage(
                    name: '/RedeemPromoCode', page: () => RedeemPromoCode()),
                // Add more routes here if needed
              ],
            );
          }),
        );
      },
    );
  }
}
