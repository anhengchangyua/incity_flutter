import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/model/theme_model.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'config/i18n.dart';
import 'config/provider_manager.dart';
import 'config/router_manger.dart';
import 'config/storage_manager.dart';
import 'model/locale_model.dart';


import 'package:flutter_localizations/flutter_localizations.dart';



main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.init();
  runApp(MyApp());
  // Android状态栏透明 splash为白色,所以调整状态栏文字为黑色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: MultiProvider(
      providers: providers,
      child: Consumer2<ThemeModel, LocaleModel>(
          builder: (context, themeModel, localeModel, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeModel.themeData(),
          locale: localeModel.locale,
          localizationsDelegates: const [
            S.delegate,
            RefreshLocalizations.delegate, //下拉刷新
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: S.delegate.supportedLocales,
          darkTheme: themeModel.themeData(platformDarkMode: true),
          onGenerateRoute: Router.generateRoute,
          initialRoute: RouteName.splash,
        );
      }),
    ));
  }
}
