
import 'package:admin_panel/bloc/app_bloc.dart';
import 'package:admin_panel/screens/Home/widgets/left_side.dart';
import 'package:admin_panel/screens/Home/widgets/right_side.dart';
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
        if (state is AppStateIsInIncioScreen ||
            state is AppStateIsInPedidosScreen ||
            state is AppStateAddItemMenu ||
            state is AppStateIsInCardapioScreen) {
          return
               Scaffold(
                  backgroundColor: Colors.white,
                  body: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [Text('You are in windwos')],
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