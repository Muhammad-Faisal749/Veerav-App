import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:swooshed_app/controller/brand_provider/brand_provider.dart';
import 'package:swooshed_app/controller/home_provider/home_provider.dart';
import 'package:swooshed_app/controller/signupProvider/signupProvider.dart';
import 'package:swooshed_app/controller/translation_controller/translation_controller.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'controller/all_categories_provider/all_categories_provider.dart';
import 'controller/check_result_provider/check_result_provider.dart';
import 'controller/get_token_provider/get_token_provider.dart';
import 'controller/loginProvider/login_provider.dart';
import 'controller/payment_method_provider2/payment_method_provider.dart';
import 'controller/signin_with_google/signin_with_google.dart';
import 'firebase_options.dart';
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
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
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
            ChangeNotifierProvider(create: (_) => LoginProvider()),
            ChangeNotifierProvider(create: (_) => SignUpProvider()),
            ChangeNotifierProvider(create: (_) => HomeProvider()),
            ChangeNotifierProvider(create: (_) => AllCategoriesProvider()),
            ChangeNotifierProvider(create: (_) => ChooseBrandProvider()),
            ChangeNotifierProvider(create: (_) => GetTokenProvider()),
            ChangeNotifierProvider(create: (_) => CheckResultProvider()),
            ChangeNotifierProvider(create: (_) => SocialMediaLoginProvider()),
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
