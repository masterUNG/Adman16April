import 'package:adman/home_page/home_page_widget.dart';
import 'package:adman/states/authen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (context) => Authen(),
  '/homePageWidget': (context) => HomePageWidget(),
};

String initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterFlowTheme.initialize();

  await Firebase.initializeApp().then((value) async {
    print('Firebase Initial Success');

    await FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event == null) {
        initialRoute = '/authen';
      } else {
        initialRoute = '/homePageWidget';
      }
    });

    runApp(MyApp());
  }).catchError((onError) => print('hame error ===>>  $onError'));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ADMAN',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      // home: HomePageWidget(),  //หน้าเดิม
      // home: Authen(),
      routes: map,
      initialRoute: initialRoute,
    );
  }
}
