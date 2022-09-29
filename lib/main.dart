import 'package:eservice_app/features/transactions_history/bloc/transaction_history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/home_screen/view/home_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: TransactionHistoryBloc(),
          ),
        ],
        child: GestureDetector(
          child: MaterialApp(
            localizationsDelegates: [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales
            ],
            locale: Locale('ar', 'AE'),
            debugShowCheckedModeBanner: false,
            title: 'المحفظه',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const HomeScreen(),
          ),
        ));
  }
}
