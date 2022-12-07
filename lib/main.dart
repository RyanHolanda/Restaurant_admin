import 'package:admin_panel/bloc/app_bloc.dart';
import 'package:admin_panel/repos/items_repositories.dart';
import 'package:admin_panel/screens/Home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'dart:io' show Platform;

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
  if (Platform.isWindows) {
    doWhenWindowReady(() async {
      const initialSize = Size(600, 450);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.title = 'Black Beard Burguer Admin';
      appWindow.show();
      await ItemsRepository().getItems();
      appWindow.maximize();
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppBloc(),
          ),
        ],
        child: RepositoryProvider(
          create: (context) => ItemsRepository(),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
