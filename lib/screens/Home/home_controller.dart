import 'package:admin_panel/bloc/app_bloc.dart';
import 'package:admin_panel/screens/Card%C3%A1pio/cardapio_screen.dart';
import 'package:admin_panel/screens/Home/widgets/desktop/left_side.dart';
import 'package:admin_panel/screens/Home/widgets/desktop/right_side.dart';
import 'package:admin_panel/screens/Home/widgets/mobile/above_bottom_nav_bar.dart';
import 'package:admin_panel/screens/Home/widgets/mobile/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<AppBloc>().add(AppEventGetItems());
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state is AppStateLoadingData) {
          if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
            return Center(
                child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo_white.png',
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height / 2,
                    child: const LinearProgressIndicator(
                      backgroundColor: Colors.black,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ));
          }
          if (Platform.isAndroid || Platform.isIOS) {
            return Center(
                child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo_white.png',
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                ],
              ),
            ));
          }
        }
        if (state is AppStateIsInIncioScreen ||
            state is AppStateIsInPedidosScreen ||
            state is AppStateAddItemMenu ||
            state is AppStateIsInCardapioScreen) {
          return Scaffold(
            bottomNavigationBar: Platform.isAndroid || Platform.isIOS ?  const BottomnavBar() : null,
            backgroundColor: Colors.white,
            body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (Platform.isWindows ||
                    Platform.isMacOS ||
                    Platform.isLinux) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LeftSide(),
                      RightSide(),
                    ],
                  );
                } else if (Platform.isAndroid || Platform.isIOS) {
                  return Column(
                    children: const [
                      AboveBottomBarDisplay(),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
