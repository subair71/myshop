// ignore_for_file: await_only_futures

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cores/di/injectable.dart';
import 'cores/resources/color_generation.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive
    ..initFlutter()
    ..registerAdapter(CanteenAdapter())
    


  await configureDependencies();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       
        BlocProvider(create: (ctx) => getIt<CanteenBloc>()),
      
      ],
      child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: "My Shop",
          theme: ThemeData(
            textTheme: GoogleFonts.basicTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: const SignupPage()),
    );
  }
}
