import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tfg_ac_partes_trabajo/database/my_database.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_circular_progress_indicator.dart';
import 'package:tfg_ac_partes_trabajo/pages/crear_parte_trabajo/crear_parte_trabajo_page.dart';
import 'package:tfg_ac_partes_trabajo/pages/lista_ordenes_trabajo/ordenes_trabajo_page.dart';
import 'package:tfg_ac_partes_trabajo/pages/lista_partes_trabajo/partes_trabajo_page.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/utils/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the database
  await MyDatabase.instance.database;

  runApp(const MainApp());

  configLoading();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: MyColorStyles.backgroundColor,
      ),
      locale: const Locale("es"),
      supportedLocales: const [Locale("en"), Locale("es")],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      builder: EasyLoading.init(),
      routes: {
        PartesTrabajoPage.routeName: (_) => const PartesTrabajoPage(),
        CrearParteTrabajoPage.routeName: (_) => const CrearParteTrabajoPage(),
      },
      home: const OrdenesTrabajoPage(),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorWidget = const SizedBox(
      height: 60,
      width: 60,
      child: CustomCircularProgressIndicator(
        color: MyColorStyles.redColor,
        strokeWidth: 6,
      ),
    )
    ..indicatorType = EasyLoadingIndicatorType.dualRing
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.transparent
    ..textColor = Colors.black
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskType = EasyLoadingMaskType.blur
    ..sigmaX = 5.0
    ..sigmaY = 5.0
    ..progressColor = const Color.fromRGBO(234, 81, 49, 1)
    ..indicatorColor = Colors.blue
    ..maskColor = Colors.black.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false
    ..maskUseSafeArea = true
    ..maskPadding = const EdgeInsets.only(top: kToolbarHeight)
    ..customAnimation = CustomAnimation();
}

class CustomAnimation extends EasyLoadingAnimation {
  CustomAnimation();

  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return Opacity(
      opacity: controller.value,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}

/// Para generar la pantalla splash utilizando el paquete https://pub.dev/packages/flutter_native_splash
// flutter pub run flutter_native_splash:create

// SvgPicture.asset(
//   "assets/inycom_icon.svg",
//   width: 100,
// ),